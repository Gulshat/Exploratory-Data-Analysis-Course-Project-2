# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time
# in motor vehicle emissions?
library(ggplot2)

emis <- readRDS("summarySCC_PM25.rds")

laBa <- emis[(emis$fips=="24510" | emis$fips=="06037"),]
laBa <- laBa[(laBa$type=="ON-ROAD"),]

fLaBa <- aggregate(Emissions~year+fips, laBa, sum)
la <- fLaBa[(fLaBa$fips=="06037"),]
ba <- fLaBa[(fLaBa$fips=="24510"),]
la$fips="Los Angeles"
ba$fips="Baltimor"

fLaBa <- as.data.frame(rbind(la,ba))

ggplot(fLaBa, aes(x=factor(year), y=Emissions, fill=fips,label = round(Emissions,2))) +
  geom_bar(stat="identity", width = .8) +  
  facet_grid(fips~., scales="free") +
  xlab("Year") +
  ylab("Total PM2.5 Emission in tons") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))

dev.copy(png, "plot6.png",width = 480, height = 480)
dev.off()
