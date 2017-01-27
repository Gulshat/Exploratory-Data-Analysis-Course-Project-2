# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base
# plotting system to make a plot answering this question.

# Let's load a data
emissions_data <- readRDS("summarySCC_PM25.rds")

head(emissions_data)
dim(emissions_data)
str(emissions_data)

maryland<-emissions_data[(emissions_data$fips =="24510"),]

dim(maryland)

total.maryland <- aggregate(Emissions ~ year, maryland, sum)
head(total.maryland)

barplot(height=total.maryland$Emissions/1000, names.arg=total.maryland$year,
        xlab = "Year", ylab = "Emissions", main = "Total PM2.5 Emission in Baltimore")

dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
