# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, on
# road, nonroad) variable, which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? Which have seen increases 
# in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
# answer this question
library(ggplot2)

scc <- readRDS("Source_Classification_Code.rds")
emssc <- readRDS("summarySCC_PM25.rds")

# Let's explore scc

head(scc)
dim(scc)
str(scc)

# Let's explore emssc

head(emssc)
dim(emssc)
str(emssc)

# We need only Baltimor city data from both data sets.

baltimor_emssc <- emssc[(emssc$fips=='24510'),]

# Two plots have one foreigh key SCC, we need to  use 
# it for merging two tables.

m_baltimor <- merge(baltimor_emssc, scc, by = "SCC")
fems <-aggregate(Emissions~year+type, m_baltimor, sum)

ggplot(fems, aes(fems$year, fems$Emissions, color=type))+
  geom_line()+xlab("Year")+ylab("Emissions")+
  ggtitle("Total PM2.5 Emissions in Baltimore City, 
          Maryland from 1999 to 2008")

dev.copy(png, "plot3.png", height = 480, widht = 480)
def.off()
