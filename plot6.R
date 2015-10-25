library(ggplot2)
if(!exists("NEI")){
    NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./Source_Classification_Code.rds")
}

# Baltimore is 24510, Los Angeles is 06037
fipsNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

PM25TotalByYearAndFips <- aggregate(Emissions ~ year + fips, fipsNEI, sum)
PM25TotalByYearAndFips$fips[PM25TotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
PM25TotalByYearAndFips$fips[PM25TotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(PM25TotalByYearAndFips, aes(factor(year), fill=year, Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle in Baltimore, MD vs Los Angeles, CA 1999 to 2008')
print(g)
dev.off()