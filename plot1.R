## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## 
## Question:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

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

# get the total emissions by year
TotalemissionsPerYear <- aggregate(Emissions ~ year, NEI, sum)

# make the plot 1
png('plot1.png')
barplot(height = TotalemissionsPerYear$Emissions, names.arg = TotalemissionsPerYear$year, xlab = 'Year', ylab = expression('Total PM'[2.5]*' Emissions Per Year (tons)'), main = expression('Total PM'[2.5]*' Emissions at Each Year'))
dev.off()



