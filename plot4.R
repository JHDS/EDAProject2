library(ggplot2)
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
SCC <- SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE),c(1)]
NEI <- NEI[NEI$SCC %in% SCC,c(4,6)]
NEI <- aggregate(. ~ year, data=NEI, FUN=sum)
png(filename = "plot4.png", width = 480, height = 480)
g <- ggplot(data=NEI, aes(x=year, y=Emissions)) +
  geom_line() + geom_point() + ggtitle("Coal Emissions")
print(g)
dev.off()