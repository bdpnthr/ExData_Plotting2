## plot5.R
## Question 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Identify motor vehicle SCC codes
vehicleSCC <- SCC[grep("Vehicle", SCC$EI.Sector), ]$SCC

## Subset NEI data for Baltimore City motor vehicle sources
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC & NEI$fips == "24510", ]

## Load ggplot2
library(ggplot2)

## Create the PNG plot
png("plot5.png", width=480, height=480)
ggplot(vehicleNEI, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity", fill="steelblue") +
    labs(x="Year", y="PM2.5 Emissions (tons)",
         title="Baltimore Motor Vehicle PM2.5 Emissions (1999–2008)")
dev.off()
