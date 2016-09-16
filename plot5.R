## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## 
## Question:
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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

# get the motor vehicle sources (type= ON-ROAD) in Baltimore city (fips = 24510) 
Baltimoremotorsub <- subset(NEI, fips == '24510' & type == 'ON-ROAD')

# #get the total emissions of Baltimore by year
BaltimoremotorsubPerYear <- aggregate(Emissions ~ year, Baltimoremotorsub, sum)
BaltimoremotorsubPerYear$year <- as.character(BaltimoremotorsubPerYear$year)

# make the plot 5
png('plot5.png')
ggplot(data = BaltimoremotorsubPerYear, aes(year, Emissions)) +
  geom_bar(position="stack", stat="identity") +
  labs(x = 'Year', y = expression('PM'[2.5]*' Emissions (tons)')) +
  ggtitle(expression('Baltimore Motor Vehicle PM'[2.5]*' Emissions Each Year'))
dev.off()