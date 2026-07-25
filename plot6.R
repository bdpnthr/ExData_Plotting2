## plot6.R
## Question 6: Compare emissions from motor vehicle sources in Baltimore City vs Los Angeles County (1999–2008)

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Identify motor vehicle SCC codes
vehicleSCC <- SCC[grep("Vehicle", SCC$EI.Sector), ]$SCC

## Subset NEI data for Baltimore and Los Angeles motor vehicle sources
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC & 
                  (NEI$fips == "24510" | NEI$fips == "06037"), ]

## Relabel fips codes for clarity
vehicleNEI$fips <- factor(vehicleNEI$fips, 
                          levels = c("24510", "06037"),
                          labels = c("Baltimore City", "Los Angeles County"))

## Load ggplot2
library(ggplot2)

## Create the PNG plot
png("plot6.png", width=480, height=480)
ggplot(vehicleNEI, aes(x=factor(year), y=Emissions, fill=fips)) +
    geom_bar(stat="identity", position="dodge") +
    labs(x="Year", y="PM2.5 Emissions (tons)",
         title="Motor Vehicle PM2.5 Emissions: Baltimore vs Los Angeles (1999–2008)") +
    scale_fill_manual(values=c("steelblue", "darkorange"))
dev.off()
