# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

scc <- readRDS("Source_Classification_Code.rds")
emis <- readRDS("summarySCC_PM25.rds")

sub.scc <- scc[grepl("Coal", scc$Short.Name),]

sub.emis <- emis[(emis$SCC %in% sub.scc$SCC),]

femis <- aggregate(Emissions~year, sub.emis, sum)

ggplot(femis, aes(femis$year, femis$Emissions)) + geom_line()+
  xlab("Year") + ylab("Emissions") + 
  ggtitle("Coal combustion-related sources")

dev.copy(png, 'plot4.png', width = 480, height = 480)
dev.off()
