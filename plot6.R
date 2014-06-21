library(ggplot2)
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California
# (fips == "06037"). Which city has seen greater changes over time in motor
# vehicle emissions?
NEI <- readRDS("data/summarySCC_PM25.rds")
NEI <- NEI[NEI$fips %in% c("24510","06037"),]
NEI <- NEI[NEI$type=="ON-ROAD",c(1,4,6)]

# This function changes the labels of the facets in the plot.
chg_facet_label <- function(var, value) {
  value <- as.character(value)
  if (var == "fips") {
    value[value=="24510"] <- "Baltimore City"
    value[value=="06037"] <- "L.A. County"
  }
  return(value)
}

png(filename = "plot6.png", width = 480, height = 480)
g <- ggplot(NEI, aes(x = factor(year), y = Emissions))
g <- g + geom_bar(stat = "identity")
g <- g + facet_grid(. ~ fips, labeller = chg_facet_label)
g <- g + labs(title = expression(PM[2.5] * " From Motor Vehicle Sources"))
g <- g + labs(x = "Year", y = expression(PM[2.5] * " (tons)"))
print(g)
dev.off()