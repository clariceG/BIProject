# *****************************************************************************
# BI-PROJECT ----

# Course Code: BBT4206
# Course Name: Business Intelligence II

# Student: Clarice Muthoni.

# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# Introduction to Milestone 2 ----

## 1: Install and use renv ----
renv::restore()
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

## Missingness Map to Identify Missing Data ----
# Execute the following to create a map to identify the missing data in each
# dataset:
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

# There are no missing data
missmap(census2, col = c("red", "grey"), legend = TRUE)


# Data Transforms ----
# Data transforms can improve the accuracy of your final model when applied as
# part of the pre-processing stage.

## Install and Load the Required Packages ----
## mlbench
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## readr
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## factoextra
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## FactoMineR
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## Basic data transforms ----
### (i) Scale Data Transform ----
# BEFORE
summary(census2)

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

model_of_the_transform <- preProcess(census2, method = c("scale"))
print(model_of_the_transform)
census2_scale_transform <- predict(model_of_the_transform,
                                          census2)

# AFTER
summary(census2_scale_transform )

# Age
hist(census2_scale_transform$age, main = names(census2_scale_transform)[which(names(census2_scale_transform) == 'age')])

# Education-num
hist(census2_scale_transform$`education-num`, main = names(census2_scale_transform)[which(names(census2_scale_transform) == 'education-num')])

# Capital-gain
hist(census2_scale_transform$`capital-gain`, main = names(census2_scale_transform)[which(names(census2_scale_transform) == 'capital-gain')])

# Capital-loss
hist(census2_scale_transform$`capital-loss`, main = names(census2_scale_transform)[which(names(census2_scale_transform) == 'capital-loss')])

# hours-per-week
hist(census2_scale_transform$`hours-per-week`, main = names(census2_scale_transform)[which(names(census2_scale_transform) == 'hours-per-week')])

### (ii) Centering Data Transform ----

summary(census2)
model_of_the_transform <- preProcess(census2, method = c("center"))
print(model_of_the_transform)
census2_center_transform <- predict(model_of_the_transform, census2)
summary(census2_center_transform)

### (iii) Standardization ----
summary(census2)
# BEFORE
sapply(census[,c(1,4,10,11,12)], sd)
model_of_the_transform <- preProcess(census2,
                                     method = c("scale", "center"))
print(model_of_the_transform)
census2_standardize_transform <- predict(model_of_the_transform, census2)
# AFTER
summary(census2_standardize_transform)
sapply(census2_standardize_transform[,c(1,4,10,11,12)], sd)

### (iv) Normalization ----
summary(census2)
model_of_the_transform <- preProcess(census2, method = c("range"))
print(model_of_the_transform)
census2_normalize_transform <- predict(model_of_the_transform, census2)
summary(census2_normalize_transform)

## Power transforms ----

### (i) Box-Cox ----
# BEFORE
summary(census2)

#Calculate the skewness before the Box-Cox transform
sapply(census2[,c(1,4,10,11,12)], skewness, type = 2)

#histogram to view the skewness before the Box-Cox transform
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

model_of_the_transform <- preProcess(census2, method = c("BoxCox"))
print(model_of_the_transform)
census2_box_cox_transform <- predict(model_of_the_transform, # nolint
                                     census2)
# AFTER
summary(census2_box_cox_transform)

sapply(census2_box_cox_transform[,c(1,4,10,11,12)], skewness, type = 2)

# Age
hist(census2_box_cox_transform$age, main = names(census2_box_cox_transform)[which(names(census2_box_cox_transform) == 'age')])

# Education-num
hist(census2_box_cox_transform$`education-num`, main = names(census2_box_cox_transform)[which(names(census2_box_cox_transform) == 'education-num')])

# Capital-gain
hist(census2_box_cox_transform$`capital-gain`, main = names(census2_box_cox_transform)[which(names(census2_box_cox_transform) == 'capital-gain')])

# Capital-loss
hist(census2_box_cox_transform$`capital-loss`, main = names(census2_box_cox_transform)[which(names(census2_box_cox_transform) == 'capital-loss')])

# hours-per-week
hist(census2_box_cox_transform$`hours-per-week`, main = names(census2_box_cox_transform)[which(names(census2_box_cox_transform) == 'hours-per-week')])

### (ii)Yeo-Johnson ----
# BEFORE
summary(census2)

#Calculate the skewness before the Box-Cox transform
sapply(census2[,c(1,4,10,11,12)], skewness, type = 2)

#histogram to view the skewness before the Box-Cox transform
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

model_of_the_transform <- preProcess(census2, method = c("YeoJohnson"))
print(model_of_the_transform)
census2_yeo_johnson_transform <- predict(model_of_the_transform, # nolint
                                                census2)
# AFTER
summary(census2_yeo_johnson_transform)

# Calculate the skewness after the Yeo-Johnson transform
sapply(census2_yeo_johnson_transform[,c(1,4,10,11,12)],  skewness, type = 2)

# Age
hist(census2_yeo_johnson_transform$age, main = names(census2_yeo_johnson_transform)[which(names(census2_yeo_johnson_transform) == 'age')])

# Education-num
hist(census2_yeo_johnson_transform$`education-num`, main = names(census2_yeo_johnson_transform)[which(names(census2_yeo_johnson_transform) == 'education-num')])

# Capital-gain
hist(census2_yeo_johnson_transform$`capital-gain`, main = names(census2_yeo_johnson_transform)[which(names(census2_yeo_johnson_transform) == 'capital-gain')])

# Capital-loss
hist(census2_yeo_johnson_transform$`capital-loss`, main = names(census2_yeo_johnson_transform)[which(names(census2_yeo_johnson_transform) == 'capital-loss')])

# hours-per-week
hist(census2_yeo_johnson_transform$`hours-per-week`, main = names(census2_yeo_johnson_transform)[which(names(census2_yeo_johnson_transform) == 'hours-per-week')])


## Linear algebra transforms ----
### (i) Principal Component Analysis (PCA) ----
summary(census2)

# Exclude 'income' from the variables being scaled
model_of_the_transform <- preProcess(census2[, -14], method = c("scale", "center", "pca"))

print(model_of_the_transform)
census2_pca_dr <- predict(model_of_the_transform, census2)

summary(census2_pca_dr)
dim(census2_pca_dr)

### PCA for Feature Extraction ----
census2_pca_fe <- princomp(cor(census2[,c(1,4,10,11,12)]))
summary(census2_pca_fe)

#### Scree Plot ----
factoextra::fviz_eig(census2_pca_fe, addlabels = TRUE)

census2_pca_fe$loadings[, 1:2]

factoextra::fviz_cos2(census2_pca_fe, choice = "var", axes = 1:2)

#### Biplot and Cos2 Combined Plot ----

factoextra::fviz_pca_var(census2_pca_fe, col.var = "cos2",
                         gradient.cols = c("brown", "orange", "green"),
                         repel = TRUE)

### (ii) Independent Component Analysis (ICA) ----
if (!is.element("fastICA", installed.packages()[, 1])) {
  install.packages("fastICA", dependencies = TRUE)
}
require("fastICA")

summary(census2)

model_of_the_transform <- preProcess(census2,
                                     method = c("scale", "center", "ica"),
                                     n.comp = 0)
print(model_of_the_transform)
census2_ica_dr <- predict(model_of_the_transform, census2)

summary(census2_ica_dr)

# References ----
# Karlan, A., Dean; Wood, S., Daniel H., (2017), "The Effect of Effectiveness: 
#Donor Response to Aid Effectiveness in a Direct Mail Fundraising Experiment", 
#https://doi.org/10.7910/DVN/RDHJQZ, Harvard Dataverse, (Version 1),