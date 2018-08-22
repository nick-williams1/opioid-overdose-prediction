library(haven)
library(dplyr)
library(caret)
library(forcats)
library(fastDummies)

setwd("C:/Users/niwi8/OneDrive - cumc.columbia.edu/Practicum/opioid_prediction/data/cleaned/by_year")

# importing all overdose SAS data files into a list called list.data

dat <- list.files(pattern = "poisoning")

list.data <- list()

for (i in 1:length(dat)) {
  list.data[[i]] <- read_sas(dat[i])
}

names(list.data) <- (c("poisoning00", "poisoning01", "poisoning02", "poisoning03", "poisoning04", 
                       "poisoning05", "poisoning06", "poisoning07", "poisoning08", "poisoning09", 
                       "poisoning10", "poisoning11", "poisoning12", "poisoning13", "poisoning14", 
                       "poisoning15", "poisoning16", "poisoning99"))

# factoring over all categorical variables across all datasets in list.data and creating dummy variables

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

need_dummy <- c("age_cat", "sex", "race", "hispanic", "education", "mar_cat", "day", "place")

for (i in 1:length(list.data)) {
  list.data[[i]] <- dummy_cols(list.data[[i]], 
                               select_columns = need_dummy, 
                               remove_first_dummy = TRUE) 
}

# using min-max standardization for continuous variables

s <- c("poverty_rate", "phys", "percent_female_head", "pop_density", "dens_sq", "income")

normalize <- function(x) {
  return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))
}

for (i in 1:length(list.data)) {
  for (j in need_double) {
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

names(data.train) <- (c("poisoning00", "poisoning01", "poisoning02", "poisoning03", "poisoning04", 
                        "poisoning05", "poisoning06", "poisoning07", "poisoning08", "poisoning09", 
                        "poisoning10", "poisoning11", "poisoning12", "poisoning13", "poisoning14", 
                        "poisoning15", "poisoning16", "poisoning99"))
names(data.predict) <- (c("poisoning00", "poisoning01", "poisoning02", "poisoning03", "poisoning04", 
                          "poisoning05", "poisoning06", "poisoning07", "poisoning08", "poisoning09", 
                          "poisoning10", "poisoning11", "poisoning12", "poisoning13", "poisoning14", 
                          "poisoning15", "poisoning16", "poisoning99"))

# removing incomplete observations

train.noNA <- train %>% select(
  age_cat_<31, 
  age_cat_41-50, 
  age_cat_51-60
)

for (i in 1:length(data.train)) {
  data.train[[i]] <- data.train[[i]][complete.cases(data.train[[i]]), ]
}










# working with aggregated data... hold off for now

all_years <- read_sas("C:/Users/niwi8/OneDrive - cumc.columbia.edu/Practicum/opioid_prediction/data/cleaned/all_poisoning_county.sas7bdat")

all_years$age_cat <- as.factor(all_years$age_cat)
all_years$sex <- as.factor(all_years$sex)
all_years$race <- as.factor(all_years$race) 
all_years$hispanic <- as.factor(all_years$hispanic)
all_years$education <- as.factor(all_years$education)
all_years$mar_cat <- as.factor(all_years$mar_cat)
all_years$day <- as.factor(all_years$day)
all_years$place <- as.factor(all_years$place)
all_years$any_opioid <- as.factor(all_years$any_opioid)
all_years$only_unspecified <- as.factor(all_years$only_unspecified)
