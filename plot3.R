library(ggplot2)
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
# answer this question.
NEI <- readRDS("data/summarySCC_PM25.rds")
NEI <- NEI[NEI["fips"]=="24510",c(4:6)]
NEI <- aggregate(. ~ type + year, data=NEI, FUN=sum)
png(filename = "plot3.png", width = 480, height = 480)
g <- ggplot(NEI, aes(x = factor(year), y = Emissions))
g <- g + geom_bar(stat = "identity")
g <- g + facet_grid(. ~ type)
g <- g + labs(title = expression(PM[2.5] * " Types Over Time (Baltimore City)"))
g <- g + labs(x = "Year", y = expression(PM[2.5]))
print(g)
dev.off()