library(dplyr)
library(haven)

# reading in SAS dataset

df <- read_sas("C:/Users/niwi8/OneDrive - cumc.columbia.edu/Practicum/opioid_prediction/data/cleaned/all_poisoning.sas7bdat")

# county level estimates of overdoses by year

county_death_year <- df %>% mutate(death = 1) %>%
  group_by(county, year) %>%
  count(death) 

#saving data 

write.csv(county_death_year, "C:/Users/niwi8/OneDrive - cumc.columbia.edu/Practicum/opioid_prediction/data/cleaned/county_death_year.csv", 
          row.names = FALSE)
