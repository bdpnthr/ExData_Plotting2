## plot2.R
## Question 2: Have total emissions from PM2.5 decreased in Baltimore City, Maryland (1999–2008)?

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data for Baltimore City (fips == "24510")
baltimore <- subset(NEI, fips == "24510")

## Aggregate total emissions by year
baltimoreEmissions <- aggregate(Emissions ~ year, baltimore, sum)

## Create the PNG plot
png("plot2.png", width=480, height=480)
plot(baltimoreEmissions$year, baltimoreEmissions$Emissions, type="b",
     xlab="Year", ylab="PM2.5 Emissions (tons)",
     main="Baltimore City PM2.5 Emissions (1999–2008)")
dev.off()
