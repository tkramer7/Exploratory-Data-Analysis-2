if(!exists("NEI")){
    NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./Source_Classification_Code.rds")
}

PM25TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=PM25TotalByYear$Emissions, col=c("lightblue", "mistyrose", "lightcyan", "lavender"), 
        names.arg=PM25TotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions from 1999 to 2008'))

dev.off()
