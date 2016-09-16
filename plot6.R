## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## 
## Question:
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County
## California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

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

# get the motor vehicle sources (type= ON-ROAD) in LA city (fips = 06037) 
LAmotorsub <- subset(NEI, fips == '06037' & type == 'ON-ROAD')


# #get the total emissions of Baltimore by year
BaltimoremotorsubPerYear <- aggregate(Emissions ~ year, Baltimoremotorsub, sum)
BaltimoremotorsubPerYear$city <- rep('Baltimore')
#BaltimoremotorsubPerYear$year <- as.character(BaltimoremotorsubPerYear$year)

# #get the total emissions of LA by year
LAmotorsubPerYear <- aggregate(Emissions ~ year, LAmotorsub, sum)
LAmotorsubPerYear$city <- rep('Los Angels')
#LAmotorsubPerYear$year <- as.character(LAmotorsubPerYear$year)

#combine Baltimore and LA into one dataframe by rows
MotorsubPerYear <- rbind(BaltimoremotorsubPerYear, LAmotorsubPerYear)

# make the plot 6
png('plot6.png')
ggplot(data = MotorsubPerYear) +
  geom_point(aes(x = year, y = Emissions, color = city), size = 5) +
  scale_colour_manual(values = c('red','blue')) +
  labs(x = 'Year', y = expression('PM'[2.5]*' Emissions (tons)')) +
  ggtitle(expression('Baltimore and LA PM'[2.5]*' Emissions Each Year'))
dev.off()