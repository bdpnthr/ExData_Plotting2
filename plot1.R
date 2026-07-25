## plot1.R
## Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate total emissions by year
totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

## Create the PNG plot
png("plot1.png", width=480, height=480)
plot(totalEmissions$year, totalEmissions$Emissions, type="b",
     xlab="Year", ylab="Total PM2.5 Emissions (tons)",
     main="Total PM2.5 Emissions in the U.S. (1999–2008)")
dev.off()
