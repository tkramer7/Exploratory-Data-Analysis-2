library(ggplot2)

if(!exists("NEI")){
    NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("mergedNEISCC")){
    mergedNEISCC <- merge(NEI, SCC, by="SCC")
}

# Baltimore - fips = "24510"
baltimoreEmmissions <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

PM25TotalByYear <- aggregate(Emissions ~ year, baltimoreEmmissions, sum)

png("plot5.png", width=640, height=480)
g <- ggplot(PM25TotalByYear, aes(factor(year), fill=year, Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore, MD  from 1999 to 2008')
print(g)
dev.off()