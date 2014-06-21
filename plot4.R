library(ggplot2)
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
SCC <- SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE),c(1)]
NEI <- NEI[NEI$SCC %in% SCC,c(4,6)]
NEI <- aggregate(. ~ year, data=NEI, FUN=sum)
NEI$Emissions = NEI$Emissions / 1000
png(filename = "plot4.png", width = 480, height = 480)
g <- ggplot(data=NEI, aes(x=factor(year), y=Emissions))
g <- g + geom_bar(stat = "identity")
g <- g + labs(title = expression(PM[2.5] * " From Coal Combustion Over Time"))
g <- g + labs(x = "Year", y = expression(PM[2.5] * " (thousands)"))
print(g)
dev.off()