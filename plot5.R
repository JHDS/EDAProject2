library(ggplot2)
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City? 
NEI <- readRDS("data/summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",c(4:6)]
NEI <- NEI[NEI$type=="ON-ROAD",c(1,3)]
NEI <- aggregate(. ~ year, data=NEI, FUN=sum)
png(filename = "plot5.png", width = 480, height = 480)
g <- ggplot(data=NEI, aes(x=year, y=Emissions)) +
  geom_line() + geom_point() + ggtitle("Motor Vehicle Emissions (Baltimore City)")
print(g)
dev.off()