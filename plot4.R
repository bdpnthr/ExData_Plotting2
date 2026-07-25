## plot4.R
## Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Identify coal combustion-related SCC codes
coalSCC <- SCC[grep("Coal", SCC$EI.Sector), ]$SCC

## Subset NEI data for coal combustion sources
coalNEI <- NEI[NEI$SCC %in% coalSCC, ]

## Load ggplot2
library(ggplot2)

## Create the PNG plot
png("plot4.png", width=480, height=480)
ggplot(coalNEI, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity", fill="darkred") +
    labs(x="Year", y="PM2.5 Emissions (tons)",
         title="U.S. Coal Combustion PM2.5 Emissions (1999–2008)")
dev.off()
