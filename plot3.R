## plot3.R
## Question 3: Of the four source types (point, nonpoint, onroad, nonroad),
## which have seen decreases or increases in emissions from 1999–2008 in Baltimore City?

## Load the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data for Baltimore City (fips == "24510")
baltimore <- subset(NEI, fips == "24510")

## Load ggplot2
library(ggplot2)

## Create the PNG plot
png("plot3.png", width=480, height=480)
ggplot(baltimore, aes(x=factor(year), y=Emissions, fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(. ~ type) +
    labs(x="Year", y="PM2.5 Emissions (tons)",
         title="Baltimore City PM2.5 Emissions by Source Type (1999–2008)")
dev.off()
