
library(e1071)
library(haven)

setwd("C:/Users/niwi8/OneDrive/Documents/Practicum/opioid_prediction/data/cleaned/by_year")

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

