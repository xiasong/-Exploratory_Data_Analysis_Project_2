## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## 
## Question:
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

#set current work directory
setwd('/Users/xiasong/Documents/Class_2016/Coursera/datasciencecoursera/Exploratory_Data_Analysis/project2/')

#check the content of work directory
dir()

#import data into R
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

#check the structure, head and tail of two dataframes
str(NEI)
head(NEI)
tail(NEI)

str(SCC)
head(SCC)
tail(SCC)

#get the subset data of Baltimore county
Baltimoresub <- subset(NEI, fips == '24510')

#get the total emissions by year
BaltimoreemissionsPerYear <- aggregate(Emissions ~ year, Baltimoresub, sum)

# make the plot 2
png('plot2.png')
barplot(height = BaltimoreemissionsPerYear$Emissions, names.arg = BaltimoreemissionsPerYear$year, xlab = 'Year', ylab = expression('Baltimore PM'[2.5]*' Emissions Per Year (tons)'), main = expression('Baltimore PM'[2.5]*' Emissions at Each Year'))
dev.off()