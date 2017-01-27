# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

emissions_data <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")

# Let's explore emissions_data

head(emissions_data)
dim(emissions_data)
str(emissions_data)

# Let's explore classification

head(classification)
dim(classification)
str(classification)

total.emissions <- with(emissions_data, aggregate(Emissions, 
                                               by =list(year), sum))

head(total.emissions)
# Tatal emissions show big numbers, for creting better plot 
# I divided total.emissions$x 10000

total.emissions$x <- total.emissions$x/10000

plot(total.emissions$Group.1, total.emissions$x,type = 'l',col="red",lwd =3, 
        ylab="Emissions",xlab="Year", main="Total PM2.5 emission each of the years 1999 - 2008.")

dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
