library(e1071)
library(caret)

# svm models by year for any opioid use

df.train[[1]]$any_opioid <- as.factor(df.train[[1]]$any_opioid)
df.test[[1]]$any_opioid <- as.factor(df.test[[1]]$any_opioid)
data.predict[[1]]$any_opioid <- as.factor(data.predict[[1]]$any_opioid)

svm_00 <- svm(
  any_opioid ~ pop_density +
    dens_sq +
    phys +
    percent_female_head +
    income +
    poverty_rate +
    sex_dummy +
    race1 +
    race2 +
    mar_dummy +
    educ1 +
    educ2 +
    educ3 +
    educ4 +
    age1 +
    age2 +
    age3 +
    age4 +
    age5 +
    age6 +
    day1 +
    day2 +
    day3 +
    day4 +
    day5 +
    day6 +
    day7 +
    place1 +
    place2 +
    place3 +
    place4,
  data = df.train[[1]],
  scale = FALSE,
  kernel = "radial",
  gamma = 1,
  cost = 0.1
)

confusionMatrix(df.train[[1]]$any_opioid, predict(svm_00), 
                positive = "1")

predict00 <- predict(svm_00, df.test[[1]])

confusionMatrix(df.test[[1]]$any_opioid, predict00, 
                positive = "1")

x <- predict(svm_00, data.predict[[1]])

