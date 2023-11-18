# *****************************************************************************
# BI-PROJECT ----

# Course Code: BBT4206
# Course Name: Business Intelligence II

# Student: Clarice Muthoni.

# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# Introduction ----

## 1: Install and use renv ----
renv::init()
# use renv::init() to initialize renv in a new
# project.

# The prompt received after executing renv::init() is as shown below:
# This project already has a lockfile. What would you like to do?

# 1: Restore the project from the lockfile.
# 2: Discard the lockfile and re-initialize the project.
# 3: Activate the project without snapshotting or installing any packages.
# 4: Abort project initialization.

# Select option 1 to restore the project from the lockfile
# renv::init() # nolint

# Execute the following command to list all the libraries available in your
# computer:
.libPaths()

# Execute the following command to see which packages are available in
# each library:
lapply(.libPaths(), list.files)

## 2: Loading the dataset ----
library(readr)
census <- read_csv("data/census.csv")
View(census)

## 3: Preview Loaded Dataset ----

### Dimensions ----
dim(census)
# Because the dataset is large and has 45222 rows and 14 columns, it 
# will be reduced to 1000 rows and 14 columns.

# Reduce datasets
census2 <- census[sample(nrow(census), 1000), ]
View(census2)

# Save as CSV
write.csv(census2, file = "C:/Users/clari/OneDrive/Desktop/API/BIProject/data/census2.csv", row.names = FALSE)

# Now, census2 will be the dataset that will be used throughout the 
# the project.

### Data Types ----
sapply(census2, class)

# Descriptive Statistics ----
## A. Measures of frequency ----
census2_freq <- census2$income   # For Income
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$relationship   # For Relationship
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$occupation      # For Occupation
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$workclass        # For workclass
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$education_level   # For education_level
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$`marital-status`   # For marital_status
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$sex   # For sex
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$race   # For race
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

census2_freq <- census2$`native-country`   # For native_country
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)

## B.Measures of Central Tendency ----
# Calculate the Mode
census2_income_mode <- names(table(census2$income))[      # For income
  which(table(census2$income) == max(table(census2$income)))
]
print(census2_income_mode)

census2_age_mode <- names(table(census2$age))[      # For age
  which(table(census2$age) == max(table(census2$age)))
]
print(census2_age_mode)

## C. Measure of distribution of the data ----
### 1. Summary of Distribution ----
summary(census2)

### 2. Standard deviation ----
sapply(census[,c(1,4,10,11,12)], sd)

### 3. Measure of Variance ----
sapply(census[,c(1,4,10,11,12)], var)

### 4. Measure of Kurtosis ----

# In “type = 2” (used in SPSS and SAS):
# 1.	Kurtosis < 3 implies a low number of outliers
# 2.	Kurtosis = 3 implies a medium number of outliers
# 3.	Kurtosis > 3 implies a high number of outliers

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

sapply(census[,c(1,4,10,11,12)], kurtosis, type = 2)
# capital-gain, capital-loss and hours-per-week have a 
# high number of outliers

### 5. Measure of Skewness ----

# 1. Skewness between -0.4 and 0.4 (inclusive) implies that there 
# is no skew in the distribution of results; the distribution of results 
# is symmetrical;it is a normal distribution:Gaussian distribution

# 2. Skewness above 0.4 implies a positive skew; 
# a right-skewed distribution. (age, capital-gain, capital-loss)

# 3. Skewness below -0.4 implies a negative skew; 
# a left-skewed distribution.(hours-per-week)

sapply(census[,c(1,4,10,11,12)], skewness, type = 2)


## D. Measures of Relationship ----
### 1. Measure the covariance between variables ----
census2_cov <- cov(census2[, c(1,4,10,11,12)])
View(census2_cov)

### 2. Measure the correlation between variables ----
census2_cor <- cor(census2[, c(1,4,10,11,12)])
View(census2_cor) 


# Inferential Statistics ----
### ANOVA ----
# Dependent variable:	Income
# Independent variables: age, workclass, education_level, education-num, 
# marital-status, occupation, relationship, race, sex, capital-gain, 
# capital-loss, hours-per-week, native-country

#### (i) One-Way ANOVA ----
result_one_way <- aov(`hours-per-week` ~ education_level, data = census2)
summary(result_one_way)

#### (ii) Two-Way ANOVA ----
result_two_way <- aov(`hours-per-week` ~ education_level * `marital-status`, data = census2)
summary(result_two_way)

# Basic Visualizations ----
## (i) Univariate Plots ----
### Histograms for Each Numeric Attribute ----
# Age
age <- as.numeric(unlist(census2[, 1]))
hist(age, main = names(census2)[1])

# Education-num
`education-num` <- as.numeric(unlist(census2[, 4]))
hist(`education-num`, main = names(census2)[4])

# Capital-gain
`capital-gain` <- as.numeric(unlist(census2[, 10]))
hist(`capital-gain`, main = names(census2)[10])

# Capital-loss
`capital-loss` <- as.numeric(unlist(census2[, 11]))
hist(`capital-loss`, main = names(census2)[11])

# hours-per-week
`hours-per-week` <- as.numeric(unlist(census2[, 12]))
hist(`hours-per-week`, main = names(census2)[12])

### Box and Whisker Plots for Each Numeric Attribute ----
boxplot(census2[, 1], main = names(census2)[1])
boxplot(census2[, 4], main = names(census2)[4])
boxplot(census2[, 10], main = names(census2)[10])
boxplot(census2[, 11], main = names(census2)[11])
boxplot(census2[, 12], main = names(census2)[12])

### Bar Plots for Each Categorical Attribute ----
barplot(table(census2[, 2]), main = names(census2)[2])
barplot(table(census2[, 3]), main = names(census2)[3])
barplot(table(census2[, 5]), main = names(census2)[5])
barplot(table(census2[, 6]), main = names(census2)[6])
barplot(table(census2[, 7]), main = names(census2)[7])
barplot(table(census2[, 8]), main = names(census2)[8])
barplot(table(census2[, 9]), main = names(census2)[9])
barplot(table(census2[, 13]), main = names(census2)[13])
barplot(table(census2[, 14]), main = names(census2)[14])

## (ii) Multivariate Plots ----
# corrplot
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")

# ggplot
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")

# caret
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")

# listenv
if (!requireNamespace("listenv", quietly = TRUE)) {
  install.packages("listenv", dependencies = TRUE)
}
library(listenv)

# parallelly
if (!requireNamespace("parallelly", quietly = TRUE)) {
  install.packages("parallelly", dependencies = TRUE)
}
library(parallelly)

# globals
if (!is.element("globals", installed.packages()[, 1])) {
  install.packages("globals", dependencies = TRUE)
}
library(globals)

#### Correlation Plot ----
ggcorrplot(cor(census2[,c(1,4,10,11,12)]))

#### Create a Scatter Plot ----
pairs(~ age  + `education-num` + `hours-per-week`, data = census2, col = as.numeric(factor(census2$income)))

# Alternatively, the ggcorrplot package can be used to make the plots more
# appealing:
ggplot(census2,
       aes(x = `hours-per-week`, y = `marital-status`, shape = income, color = income)) +
  geom_point() +
  geom_smooth(method = lm)

### Multivariate Box and Whisker Plots by Class ----
featurePlot(x = census2[, 10:12], y = census2[, 14], plot = "box")
