## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## 
## Question:
## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
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
BaltimoreemissionsPerYeartype <- aggregate(Emissions ~ year+type, Baltimoresub, sum)
BaltimoreemissionsPerYeartype$year <- as.character(BaltimoreemissionsPerYeartype$year)
str(BaltimoreemissionsPerYeartype)

# make the plot 3
png('plot3.png')
ggplot(data = BaltimoreemissionsPerYeartype, aes(year, Emissions)) +
  geom_bar(position="stack", stat="identity") +
  labs(x = 'Year', y = expression('PM'[2.5]*' Emissions (tons)')) +
  facet_wrap(~type) + 
  ggtitle(expression('Baltimore PM'[2.5]*' Emissions Each Year and Each Type'))
dev.off()