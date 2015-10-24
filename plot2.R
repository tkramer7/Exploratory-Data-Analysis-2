NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

baltimore  <- NEI[NEI$fips=="24510", ]

PM25TotalByYear <- aggregate(Emissions ~ year, baltimore, sum)

png('plot2.png')
barplot(height=PM25TotalByYear$Emissions, names.arg=PM25TotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in Baltimore, MD emissions from 1999 to 2008'))

dev.off()