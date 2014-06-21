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
g <- ggplot(data=NEI, aes(x=year, y=Emissions, group=type, colour=type)) +
  geom_line() + geom_point()
print(g)
dev.off()