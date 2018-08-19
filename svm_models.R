
library(e1071)
library(haven)
library(dplyr)

setwd("C:/Users/niwi8/OneDrive/Documents/Practicum/opioid_prediction/data/cleaned/by_year")

# using a for loop to import all overdose data files into a list called list.data

dat <- list.files(path = "C:/Users/niwi8/OneDrive/Documents/Practicum/opioid_prediction/data/cleaned/by_year", 
                  pattern = "poisoning")


list.data <- list()

for (i in 1:length(dat))  {
  list.data[[i]] <- read_sas(dat[i])
}

names(list.data) <- (c("poisoning00", "poisoning01", "poisoning02", "poisoning03", "poisoning04", 
                       "poisoning05", "poisoning06", "poisoning07", "poisoning08", "poisoning09", 
                       "poisoning10", "poisoning11", "poisoning12", "poisoning13", "poisoning14", 
                       "poisoning15", "poisoning16", "poisoning99"))

# factoring over all categorical variables across all datasets in list.data using a for loop

for (i in 1:length(list.data)) {
  list.data[[i]]$age_cat <- as.factor(list.data[[i]]$age_cat)
  list.data[[i]]$sex <- as.factor(list.data[[i]]$sex)
  list.data[[i]]$race <- as.factor(list.data[[i]]$race) 
  list.data[[i]]$hispanic <- as.factor(list.data[[i]]$hispanic)
  list.data[[i]]$education <- as.factor(list.data[[i]]$education)
  list.data[[i]]$mar_cat <- as.factor(list.data[[i]]$mar_cat)
  list.data[[i]]$day <- as.factor(list.data[[i]]$day)
  list.data[[i]]$place <- as.factor(list.data[[i]]$place)
  list.data[[i]]$any_opioid <- as.factor(list.data[[i]]$any_opioid)
  list.data[[i]]$only_unspecified <- as.factor(list.data[[i]]$only_unspecified)
}

#separating all data sets into training and testing versions

data.train <- list()
data.test <- list()

for (i in 1:length(list.data)) {
  data.train[[i]] <- list.data[[i]] %>% 
    filter(only_unspecified == "0") 
  data.test[[i]] <- list.data[[i]] %>% 
    filter(only_unspecified == "1")
}

names(data.train) <- (c("poisoning00", "poisoning01", "poisoning02", "poisoning03", "poisoning04", 
                       "poisoning05", "poisoning06", "poisoning07", "poisoning08", "poisoning09", 
                       "poisoning10", "poisoning11", "poisoning12", "poisoning13", "poisoning14", 
                       "poisoning15", "poisoning16", "poisoning99"))
names(data.test) <- (c("poisoning00", "poisoning01", "poisoning02", "poisoning03", "poisoning04", 
                       "poisoning05", "poisoning06", "poisoning07", "poisoning08", "poisoning09", 
                       "poisoning10", "poisoning11", "poisoning12", "poisoning13", "poisoning14", 
                       "poisoning15", "poisoning16", "poisoning99"))
 











