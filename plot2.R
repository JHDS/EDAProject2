# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.
NEI <- readRDS("data/summarySCC_PM25.rds")
NEI <- NEI[NEI["fips"]=="24510",c(4,6)]
NEI <- aggregate(. ~ year, data=NEI, FUN=sum)
png(filename = "plot2.png", width = 480, height = 480)
barplot(NEI$Emissions, names.arg=NEI$year,
     xlab="Year",
     ylab=expression(PM[2.5] * " (tons)"),
     main=expression(PM[2.5] * " - Baltimore City"))
dev.off()