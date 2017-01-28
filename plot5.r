# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

scc <- readRDS("Source_Classification_Code.rds")
emis <- readRDS("summarySCC_PM25.rds")

maryland <- emis[(emis$fips=="24510"),]
maryland <- maryland[(maryland$type=="ON-ROAD"),]
marylandByYear <- aggregate(Emissions~year, maryland,sum)

ggplot(marylandByYear, aes(marylandByYear$year, marylandByYear$Emissions))+
  geom_bar(stat="identity")+
  xlab("Year") + ylab("Emissions")+
  ggtitle("Coal combustion-related sources")

dev.copy(png, 'plot5.png', width = 480, height = 480)
dev.off()
