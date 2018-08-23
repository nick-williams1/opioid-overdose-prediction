library(haven)
library(dplyr)

setwd("C:/Users/niwi8/OneDrive - cumc.columbia.edu/Practicum/opioid_prediction/data/cleaned/by_year")

# importing all overdose SAS data files into a list called list.data

dat <- list.files(pattern = "poisoning")

list.data <- list()

for (i in 1:length(dat)) {
  list.data[[i]] <- read_sas(dat[i])
}

f <- c(
  "poisoning00",
  "poisoning01",
  "poisoning02",
  "poisoning03",
  "poisoning04",
  "poisoning05",
  "poisoning06",
  "poisoning07",
  "poisoning08",
  "poisoning09",
  "poisoning10",
  "poisoning11",
  "poisoning12",
  "poisoning13",
  "poisoning14",
  "poisoning15",
  "poisoning16",
  "poisoning99"
)

names(list.data) <- f

# using min-max standardization for continuous variables

b <-
  c("poverty_rate",
    "phys",
    "percent_female_head",
    "pop_density",
    "dens_sq",
    "income")

normalize <- function(x) {
  return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))
}

for (i in 1:length(list.data)) {
  for (j in b) {
    list.data[[i]][, j] <- normalize(list.data[[i]][, j])
  }
}

# separating all data sets into training and testing versions contained in lists data.train and data.test

data.train <- list()
data.predict <- list()

for (i in 1:length(list.data)) {
  data.train[[i]] <- list.data[[i]] %>% 
    filter(only_unspecified == "0") 
  data.predict[[i]] <- list.data[[i]] %>% 
    filter(only_unspecified == "1")
}

names(data.train) <- f
names(data.predict) <- f

for (i in 1:length(data.train)) {
  data.train[[i]] <- data.train[[i]] %>% 
    select(state, 
           county, 
           year, 
           any_opioid, 
           only_unspecified,
           pop_density, 
           dens_sq, 
           phys, 
           percent_female_head, 
           income, 
           poverty_rate, 
           sex_dummy, 
           race1, 
           race2, 
           mar_dummy, 
           educ1, 
           educ2, 
           educ3, 
           educ4, 
           age1, 
           age2, 
           age3, 
           age4, 
           age5, 
           age6, 
           day1, 
           day2, 
           day3, 
           day4, 
           day5, 
           day6, 
           day7, 
           place1, 
           place2, 
           place3, 
           place4
           )
}

for (i in 1:length(data.predict)) {
  data.predict[[i]] <- data.predict[[i]] %>% 
    select(state, 
           county, 
           year, 
           any_opioid, 
           only_unspecified,
           pop_density, 
           dens_sq, 
           phys, 
           percent_female_head, 
           income, 
           poverty_rate, 
           sex_dummy, 
           race1, 
           race2, 
           mar_dummy, 
           educ1, 
           educ2, 
           educ3, 
           educ4, 
           age1, 
           age2, 
           age3, 
           age4, 
           age5, 
           age6, 
           day1, 
           day2, 
           day3, 
           day4, 
           day5, 
           day6, 
           day7, 
           place1, 
           place2, 
           place3, 
           place4
    )
}

# removing incomplete observations

for (i in 1:length(data.train)) {
  data.train[[i]] <- data.train[[i]][complete.cases(data.train[[i]]), ]
}

for (i in 1:length(data.predict)) {
  data.predict[[i]] <- data.predict[[i]][complete.cases(data.predict[[i]]), ]
}

# further dividing data.train into train and test for validation of model accruracy

train_index <- list()
df.train <- list()
df.test <- list()

for (i in 1:length(data.train)) {
  train_index[[i]] <-
    createDataPartition(data.train[[i]]$any_opioid, 1, p = 0.75, list = F)
  df.train[[i]] <- data.train[[i]][train_index[[i]], ]
  df.test[[i]] <- data.train[[i]][-train_index[[i]], ]
}





