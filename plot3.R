if(!exists("NEI")){
    NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./Source_Classification_Code.rds")
}

library(ggplot2)

# Baltimore is fips code 24510 
baltimore  <- NEI[NEI$fips=="24510", ]

PM25TotalByYear <- aggregate(Emissions ~ year + type, baltimore, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(PM25TotalByYear, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore, MD (fips == "24510") from 1999 to 2008')
print(g)
dev.off()