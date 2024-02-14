#Case Study: How Can a Wellness Technology Company Play It Smart?
#Data source: https://www.kaggle.com/arashnic/fitbit

## Upload your CSV files to R ##

## Installing and loading common packages and libraries ##
install.packages('tidyverse')
library(tidyverse)

## Load your CSV files ##
setwd("C:/Users/Desktop/Case Study Wellness Tech")
# Create a dataframe named 'daily_activity' and read in one of the CSV files from the dataset. 
daily_activity <- read.csv("dailyActivity_merged.csv")

# Create another dataframe for the sleep data.
sleep_day <- read.csv("sleepDay_merged.csv")

## Explore a few key tables ##

# Take a look at the daily_activity data.
head(daily_activity)

# Identify all the columns in the daily_activity data.
colnames(daily_activity)

# Take a look at the sleep_day data.
head(sleep_day)

# Identify all the columns in the daily_activity data.
colnames(sleep_day)

# Note that both datasets have the 'Id' field - this can be used to merge the datasets.

## Understanding some summary statistics ##

# How many unique participants are there in each dataframe?
# It looks like there may be more participants in the daily activity dataset than the sleep dataset.
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)

# How many observations are there in each dataframe?
nrow(daily_activity)
nrow(sleep_day)

# What are some quick summary statistics we'd want to know about each data frame?
# For the daily activity dataframe:
daily_activity %>%
select(TotalSteps,TotalDistance,SedentaryMinutes) %>%
summary()

# For the sleep dataframe:
sleep_day %>%
select(TotalSleepRecords,TotalMinutesAsleep,TotalTimeInBed) %>%
summary()

# What does this tell us about how this sample of people's activities?
## Plotting a few explorations ##
# What's the relationship between steps taken in a day and sedentary minutes?
# How could this help inform the customer segments that we can market to?
# E.g. position this more as a way to get started in walking more?
# Or to measure steps that you're already taking?
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()

# What's the relationship between minutes asleep and time in bed?
# You might expect it to be almost completely linear - are there any unexpected trends?

ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()

# What could these trends tell you about how to help market this product? Or areas where you might want to explore further?
## Merging these two datasets together ##
combined_data <- merge(sleep_day, daily_activity, by="Id")

# Take a look at how many participants are in this data set.
n_distinct(combined_data$Id)

