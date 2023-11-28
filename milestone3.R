# *****************************************************************************
# BI-PROJECT ----

# Course Code: BBT4206
# Course Name: Business Intelligence II

# Student: Clarice Muthoni.

# License: GNU GPL-3.0-or-later
# See LICENSE file for licensing information.
# *****************************************************************************

# Introduction to Milestone 3 ----

## 1: Install and use renv ----
renv::init()
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

# Reduce datasets
census2 <- census[sample(nrow(census), 1000), ]
View(census2)

# Save as CSV
write.csv(census2, file = "C:/Users/clari/OneDrive/Desktop/API/BIProject/data/census2.csv", row.names = FALSE)

# Now, census2 will be the dataset that will be used throughout the 
# the project.

## 3:Install and Load the Required Packages ----

## caret
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## klaR
if (require("klaR")) {
  require("klaR")
} else {
  install.packages("klaR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## readr
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## LiblineaR
if (require("LiblineaR")) {
  require("LiblineaR")
} else {
  install.packages("LiblineaR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## naivebayes
if (require("naivebayes")) {
  require("naivebayes")
} else {
  install.packages("naivebayes", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## kernlab
if (require("kernlab")) {
  require("kernlab")
} else {
  install.packages("kernlab", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## rpart
if (require("rpart")) {
  require("rpart")
} else {
  install.packages("rpart", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}


## MASS
if (require("MASS")) {
  require("MASS")
} else {
  install.packages("MASS", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## glmnet
if (require("glmnet")) {
  require("glmnet")
} else {
  install.packages("glmnet", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## stats
if (require("stats")) {
  require("stats")
} else {
  install.packages("stats", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## corrplot
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")

## ggcorrplot
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")

## Amelia
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

## dplyr - For data manipulation
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE)
}
require("dplyr")

## ggplot2 - For data visualizations using the Grammar for Graphics package
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE)
}
require("ggplot2")

## ggrepel - Additional options for the Grammar for Graphics package
if (!is.element("ggrepel", installed.packages()[, 1])) {
  install.packages("ggrepel", dependencies = TRUE)
}
require("ggrepel")

## ggraph - Additional options for the Grammar for Graphics package
if (!is.element("ggraph", installed.packages()[, 1])) {
  install.packages("ggraph", dependencies = TRUE)
}
require("ggraph")

## tidytext - For text mining
if (!is.element("tidytext", installed.packages()[, 1])) {
  install.packages("tidytext", dependencies = TRUE)
}
require("tidytext")

## tidyr - To tidy messy data
if (!is.element("tidyr", installed.packages()[, 1])) {
  install.packages("tidyr", dependencies = TRUE)
}
require("tidyr")

## widyr - To widen, process, and re-tidy a dataset
if (!is.element("widyr", installed.packages()[, 1])) {
  install.packages("widyr", dependencies = TRUE)
}
require("widyr")

## gridExtra - to arrange multiple grid-based plots on a page
if (!is.element("gridExtra", installed.packages()[, 1])) {
  install.packages("gridExtra", dependencies = TRUE)
}
require("gridExtra")

## knitr - for dynamic report generation
if (!is.element("knitr", installed.packages()[, 1])) {
  install.packages("knitr", dependencies = TRUE)
}
require("knitr")

## kableExtra - for nicely formatted output tables
if (!is.element("kableExtra", installed.packages()[, 1])) {
  install.packages("kableExtra", dependencies = TRUE)
}
require("kableExtra")

## formattable -  To create a formattable object
# A formattable object is an object to which a formatting function and related
# attributes are attached.
if (!is.element("formattable", installed.packages()[, 1])) {
  install.packages("formattable", dependencies = TRUE)
}
require("formattable")

## circlize - To create a cord diagram or visualization
# by Gu et al. (2014)
if (!is.element("circlize", installed.packages()[, 1])) {
  install.packages("circlize", dependencies = TRUE)
}
require("circlize")

## memery - For creating data analysis related memes
# The memery package generates internet memes that optionally include a
# superimposed inset plot and other atypical features, combining the visual
# impact of an attention-grabbing meme with graphic results of data analysis.
if (!is.element("memery", installed.packages()[, 1])) {
  install.packages("memery", dependencies = TRUE)
}
require("memery")

## magick - For image processing in R
if (!is.element("magick", installed.packages()[, 1])) {
  install.packages("magick", dependencies = TRUE)
}
require("magick")

## yarrr - To create a pirate plot 
if (!is.element("yarrr", installed.packages()[, 1])) {
  install.packages("yarrr", dependencies = TRUE)
}
require("yarrr")

## radarchart - To create interactive radar charts using ChartJS 
if (!is.element("radarchart", installed.packages()[, 1])) {
  install.packages("radarchart", dependencies = TRUE)
}
require("radarchart")

## igraph - To create ngram network diagrams 
if (!is.element("igraph", installed.packages()[, 1])) {
  install.packages("igraph", dependencies = TRUE)
}
require("igraph")

## wordcloud2 - For creating wordcloud by using 'wordcloud2.JS 
if (!is.element("wordcloud2", installed.packages()[, 1])) {
  install.packages("wordcloud2", dependencies = TRUE)
}
require("wordcloud2")

## textdata - Download sentiment lexicons and labeled text data sets 
if (!is.element("textdata", installed.packages()[, 1])) {
  install.packages("textdata", dependencies = TRUE)
}
require("textdata")

## stringr - For processing characters in a string
if (!is.element("stringr", installed.packages()[, 1])) {
  install.packages("stringr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("stringr")

## pROC
if (require("pROC")) {
  require("pROC")
} else {
  install.packages("pROC", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}


# drop the native table
#census2 <- subset(census2, select = -`native-country`)


# Algorithm Selection for Classification ----
# A. Linear Algorithms ----
## 1. Linear Discriminant Analysis----
### 1.a. Linear Discriminant Analysis without caret ----
# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census2$income,
                                   p = 0.7,
                                   list = FALSE)
census2_train <- census2[train_index, ]
census2_test <- census2[-train_index, ]

#### Train the model ----
census2_model_lda <- lda(income ~ ., data = census2_train)

#### Display the model's details ----
print(census2_model_lda)


#### Make predictions ----
predictions <- predict(census2_model_lda,
                       census2_test[, 1:12])$class

#### Display the model's evaluation metrics ----
table(predictions, census2_test$income)

### 1.b. Linear Discriminant Analysis with caret ----
# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census2$income,
                                   p = 0.7,
                                   list = FALSE)
census2_train <- census2[train_index, ]
census2_test <- census2[-train_index, ]

#### Train the model ----
set.seed(7)

# We apply a Leave One Out Cross Validation resampling method
train_control <- trainControl(method = "LOOCV")
# We also apply a standardize data transform to make the mean = 0 and
# standard deviation = 1

census2_caret_model_lda <- train(income ~ .,
                                data = census2_train,
                                method = "lda", metric = "Accuracy",
                                preProcess = c("center", "scale"),
                                trControl = train_control)

#### Display the model's details ----
print(census2_caret_model_lda)

#### Make predictions ----  //

levels(census2_train$education_level)
levels(census2_test$education_level)

census2_test$education_level <- factor(census2_test$education_level, levels = levels(census2_train$education_level))



predictions <- predict(census2_caret_model_lda,
                       census2_test[, 1:12])

#### Display the model's evaluation metrics ----

levels(predictions)
levels(census2_test[, 1:13]$income)

predictions <- factor(predictions, levels = levels(census2_test[, 1:13]$income))

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census2_test[, 1:13]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

##2. Regularized Linear Regression ----
### 2.a. Regularized Linear Regression Classification Problem with CARET ----
#### Load and split the dataset ----
data(census2)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census2$income,
                                   p = 0.7,
                                   list = FALSE)
census2_regression_train <- census2[train_index, ]
census2_regression_test <- census2[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
census2_caret_model_glmnet <-
  train(income ~ ., data = census2_regression_train,
        method = "glmnet", metric = "Accuracy",
        preProcess = c("center", "scale"), trControl = train_control)

#### Display the model's details ----
print(census2_caret_model_glmnet)

#### Make predictions ----
predictions <- predict(census2_caret_model_glmnet,
                       census2_regression_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_regression_test[, 1:13]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

## 3. Logistic Regression ----
### 3.a. Logistic Regression without caret ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_logistic_train <- census[train_index, ]
census_logistic_test <- census[-train_index, ]

#### Train the model ----
census_logistic_model_glm <- glm(income ~ ., data = census_logistic_train,
                                 family = binomial(link = "logit"))

#### Display the model's details ----
print(census_logistic_model_glm)

#### Make predictions ----
probabilities <- predict(census_logistic_model_glm, census_logistic_test[, 1:8],
                         type = "response")
print(probabilities)
predictions <- ifelse(probabilities > 0.5, ">50k" ,"<=50k")
print(predictions)

#### Display the model's evaluation metrics ----
table(predictions, census_logistic_test$income)

### 3.b. Logistic Regression with caret ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_logisticb_train <- census[train_index, ]
census_logisticb_test <- census[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)
# We can use "regLogistic" instead of "glm"
# Notice the data transformation applied when we call the train function
# in caret, i.e., a standardize data transform (centre + scale)
set.seed(7)
census_caret_model_logistic <-
  train(diabetes ~ ., data = census_logisticb_train,
        method = "regLogistic", metric = "Accuracy",
        preProcess = c("center", "scale"), trControl = train_control)

#### Display the model's details ----
print(census_caret_model_logistic)

#### Make predictions ----
predictions <- predict(census_caret_model_logistic,
                       census_logisticb_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_logisticb_test[, 1:9]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


# B. Non-Linear Algorithms ----
## 1.  Classification and Regression Trees ----
### 1.a. Decision tree for a classification problem without caret ----
#### Load and split the dataset ----
data(census2)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census2$income,
                                   p = 0.7,
                                   list = FALSE)
census2_train <- census2[train_index, ]
census2_test <- census2[-train_index, ]

#### Train the model ----
census2_model_rpart <- rpart(income ~ ., data = census2_train)

#### Display the model's details ----
print(census2_model_rpart)

#### Make predictions ----
predictions <- predict(census_model_rpart,
                       census_test[, 1:8],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, census_test$income)

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test[, 1:9]$diabetes)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


### 1.b. Decision tree for a classification problem with caret ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_train <- census[train_index, ]
census_test <- census[-train_index, ]

#### Train the model ----
set.seed(7)
# We apply the 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 5)
census_caret_model_rpart <- train(income ~ ., data = census,
                                  method = "rpart", metric = "Accuracy",
                                  trControl = train_control)

#### Display the model's details ----
print(census_caret_model_rpart)

#### Make predictions ----
predictions <- predict(census_model_rpart,
                       census_test[, 1:8],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, census_test$income)

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test[, 1:9]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

## 2.  Naïve Bayes ----
### 2.a. Naïve Bayes Classifier for a Classification Problem without CARET ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_train <- census[train_index, ]
census_test <- census[-train_index, ]

#### Train the model ----
census_model_nb <- naiveBayes(income ~ .,
                              data = census_train)

#### Display the model's details ----
print(census_model_nb)

#### Make predictions ----
predictions <- predict(census_model_nb,
                       census_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test[, 1:9]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

### 2.b. Naïve Bayes Classifier for a Classification Problem with CARET ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_train <- census[train_index, ]
census_test <- census[-train_index, ]

#### Train the model ----
# We apply the 5-fold cross validation resampling method
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
census_caret_model_nb <- train(income ~ .,
                               data = census_train,
                               method = "nb", metric = "Accuracy",
                               trControl = train_control)

#### Display the model's details ----
print(census_caret_model_nb)

#### Make predictions ----
predictions <- predict(census_caret_model_nb,
                       census_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test[, 1:9]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

## 3.  k-Nearest Neighbours ----
### 3.a. kNN for a classification problem without CARET's train function ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_train <- census[train_index, ]
census_test <- census[-train_index, ]

#### Train the model ----
census_caret_model_knn <- knn3(income ~ ., data = census_train, k=3)

#### Display the model's details ----
print(census_caret_model_knn)

#### Make predictions ----
predictions <- predict(census_caret_model_knn,
                       census_test[, 1:8],
                       type = "class")

#### Display the model's evaluation metrics ----
table(predictions, census_test$income)

# Or alternatively:
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

### 3.b. kNN for a classification problem with CARET's train function ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_train <- census[train_index, ]
census_test <- census[-train_index, ]

#### Train the model ----
# We apply the 10-fold cross validation resampling method
# We also apply the standardize data transform
set.seed(7)
train_control <- trainControl(method = "cv", number = 10)
census_caret_model_knn <- train(income ~ ., data = census,
                                method = "knn", metric = "Accuracy",
                                preProcess = c("center", "scale"),
                                trControl = train_control)

#### Display the model's details ----
print(census_caret_model_knn)

#### Make predictions ----
predictions <- predict(census_caret_model_knn,
                       census_test[, 1:8])

#### Display the model's evaluation metrics ----
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test[, 1:9]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

## 4.  Support Vector Machine ----
### 4.a. SVM Classifier for a classification problem without CARET ----
#### Load and split the dataset ----
data(census)

# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census$income,
                                   p = 0.7,
                                   list = FALSE)
census_train <- census[train_index, ]
census_test <- census[-train_index, ]

#### Train the model ----
census_model_svm <- ksvm(income ~ ., data = census_train,
                         kernel = "rbfdot")

#### Display the model's details ----
print(census_model_svm)

#### Make predictions ----
predictions <- predict(census_model_svm, census_test[, 1:8],
                       type = "response")

#### Display the model's evaluation metrics ----
table(predictions, census_test$income)

confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census_test[, 1:9]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")


### 4.c. SVM Classifier for a classification problem with CARET ----
#### Load and split the dataset ----
data("census2")

unique(census2_train$income)


# Define a 70:30 train:test data split of the dataset.
train_index <- createDataPartition(census2$income,
                                   p = 0.7,
                                   list = FALSE)
census2_train <- census2[train_index, ]
census2_test <- census2[-train_index, ]

#### Train the model ----
set.seed(7)
train_control <- trainControl(method = "cv", number = 5)
census_caret_model_svm_radial <- # nolint: object_length_linter.
  train(income ~ ., data = census2_train, method = "svmRadial",
        metric = "Accuracy", trControl = train_control)

#### Display the model's details ----
print(census_caret_model_svm_radial)

#### Make predictions ----
predictions <- predict(census_caret_model_svm_radial,
                       census2_test[, 1:13])

#### Display the model's evaluation metrics ----
table(predictions, census2_test$income)
confusion_matrix <-
  caret::confusionMatrix(predictions,
                         census2_test[, 1:14]$income)
print(confusion_matrix)

fourfoldplot(as.table(confusion_matrix), color = c("grey", "lightblue"),
             main = "Confusion Matrix")

# References ----
# Karlan, A., Dean; Wood, S., Daniel H., (2017), "The Effect of Effectiveness: 
#Donor Response to Aid Effectiveness in a Direct Mail Fundraising Experiment", 
#https://doi.org/10.7910/DVN/RDHJQZ, Harvard Dataverse, (Version 1),