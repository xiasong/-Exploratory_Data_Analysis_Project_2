## Course: Exploratory Data Analysis (https://class.coursera.org/exdata-032)
## Assignment: Course Project 2
## 
## Question:
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

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

# get the coal combustion-related sources from the shortname of datafram SCC
coalsubSCC <- SCC %>% filter(grepl('coal', Short.Name))

#get the emissions from coal combustion-related sources
coalsub <- NEI[NEI$SCC %in% coalsubSCC$SCC,]

# #get the total emissions by year
coalsubPerYear <- aggregate(Emissions ~ year, coalsub, sum)
coalsubPerYear$year <- as.character(coalsubPerYear$year)

# make the plot 4
png('plot4.png')
ggplot(data = coalsubPerYear, aes(year, Emissions)) +
  geom_bar(position="stack", stat="identity") +
  labs(x = 'Year', y = expression('PM'[2.5]*' Emissions (tons)')) +
  ggtitle(expression('Coal Combustion-related PM'[2.5]*' Emissions Each Year'))
dev.off()