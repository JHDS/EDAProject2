# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("data/summarySCC_PM25.rds")
NEI <- NEI[,c(4,6)]
NEI <- aggregate(. ~ year, data=NEI, FUN=sum)
png(filename = "plot1.png", width = 480, height = 480)
plot(NEI$year,NEI$Emissions,type="l",
     xlab="Year",ylab="PM2.5",main="Total PM2.5 From All Sources")
dev.off()