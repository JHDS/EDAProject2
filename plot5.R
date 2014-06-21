library(ggplot2)
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City? 
NEI <- readRDS("data/summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",c(4:6)]
NEI <- NEI[NEI$type=="ON-ROAD",c(1,3)]
NEI <- aggregate(. ~ year, data=NEI, FUN=sum)
png(filename = "plot5.png", width = 480, height = 480)
g <- ggplot(data=NEI, aes(x=factor(year), y=Emissions))
g <- g + geom_bar(stat = "identity")
g <- g + labs(title = expression(PM[2.5] * " From Motor Vehicle Sources Over Time"))
g <- g + labs(x = "Year", y = expression(PM[2.5] * " (tons)"))
print(g)
dev.off()