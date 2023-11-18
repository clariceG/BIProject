IS-2 Donation Model
================
Clarice Muthoni Gitonga
17/11/2023

- [Student Details](#student-details)
- [Introduction to Milestone 1](#introduction-to-milestone-1)
  - [1: Install and use renv](#1-install-and-use-renv)
  - [2: Loading the dataset](#2-loading-the-dataset)
  - [3: Preview Loaded Dataset](#3-preview-loaded-dataset)
    - [Dimensions](#dimensions)
    - [Data Types](#data-types)
- [Descriptive Statistics](#descriptive-statistics)
  - [A. Measures of frequency](#a-measures-of-frequency)
  - [B.Measures of Central Tendency](#bmeasures-of-central-tendency)
  - [C. Measure of distribution of the
    data](#c-measure-of-distribution-of-the-data)
    - [1. Summary of Distribution](#1-summary-of-distribution)
    - [2. Standard deviation](#2-standard-deviation)
    - [3. Measure of Variance](#3-measure-of-variance)
    - [4. Measure of Kurtosis](#4-measure-of-kurtosis)
    - [5. Measure of Skewness](#5-measure-of-skewness)
  - [D. Measures of Relationship](#d-measures-of-relationship)
    - [1. Measure the covariance between
      variables](#1-measure-the-covariance-between-variables)
    - [2. Measure the correlation between
      variables](#2-measure-the-correlation-between-variables)
- [Inferential Statistics](#inferential-statistics)
  - [ANOVA](#anova)
    - [(i) One-Way ANOVA](#i-one-way-anova)
    - [(ii) Two-Way ANOVA](#ii-two-way-anova)
- [Basic Visualizations](#basic-visualizations)
  - [(i) Univariate Plots](#i-univariate-plots)
    - [Histograms for Each Numeric
      Attribute](#histograms-for-each-numeric-attribute)
    - [Box and Whisker Plots for Each Numeric
      Attribute](#box-and-whisker-plots-for-each-numeric-attribute)
    - [Bar Plots for Each Categorical
      Attribute](#bar-plots-for-each-categorical-attribute)
  - [(ii) Multivariate Plots](#ii-multivariate-plots)
    - [Correlation Plot](#correlation-plot)
    - [Create a Scatter Plot —-](#create-a-scatter-plot--)
    - [Multivariate Box and Whisker Plots by
      Class](#multivariate-box-and-whisker-plots-by-class)

# Student Details

|                       |                 |
|-----------------------|-----------------|
| **Student ID Number** | 127707          |
| **Student Name**      | Clarice Gitonga |
| **BBIT 4.2 Group**    | 4.2B            |
| **Supervisor**        | Selina Evelia   |

# Introduction to Milestone 1

## 1: Install and use renv

``` r
renv::init()
```

    ## - The project is out-of-sync -- use `renv::status()` for details.

## 2: Loading the dataset

``` r
library(readr)
census <- read_csv("data/census.csv")
```

    ## Rows: 45222 Columns: 14
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (9): workclass, education_level, marital-status, occupation, relationshi...
    ## dbl (5): age, education-num, capital-gain, capital-loss, hours-per-week
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
View(census)
```

## 3: Preview Loaded Dataset

### Dimensions

Because the dataset is large and has 45222 rows and 14 columns, it will
be reduced to 1000 rows and 14 columns.

``` r
dim(census)
```

    ## [1] 45222    14

Reduce datasets

``` r
census2 <- census[sample(nrow(census), 1000), ]
View(census2)
```

Save as CSV

``` r
write.csv(census2, file = "C:/Users/clari/OneDrive/Desktop/API/BIProject/data/census2.csv", row.names = FALSE)
```

### Data Types

``` r
sapply(census2, class)
```

    ##             age       workclass education_level   education-num  marital-status 
    ##       "numeric"     "character"     "character"       "numeric"     "character" 
    ##      occupation    relationship            race             sex    capital-gain 
    ##     "character"     "character"     "character"     "character"       "numeric" 
    ##    capital-loss  hours-per-week  native-country          income 
    ##       "numeric"       "numeric"     "character"     "character"

# Descriptive Statistics

## A. Measures of frequency

``` r
census2_freq <- census2$income   # For Income
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##       frequency percentage
    ## <=50K       774       77.4
    ## >50K        226       22.6

``` r
census2_freq <- census2$relationship   # For Relationship
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##                frequency percentage
    ## Husband              402       40.2
    ## Not-in-family        265       26.5
    ## Other-relative        32        3.2
    ## Own-child            153       15.3
    ## Unmarried             95        9.5
    ## Wife                  53        5.3

``` r
census2_freq <- census2$occupation      # For Occupation
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##                   frequency percentage
    ## Adm-clerical            118       11.8
    ## Craft-repair            143       14.3
    ## Exec-managerial         127       12.7
    ## Farming-fishing          32        3.2
    ## Handlers-cleaners        36        3.6
    ## Machine-op-inspct        81        8.1
    ## Other-service           105       10.5
    ## Priv-house-serv           4        0.4
    ## Prof-specialty          130       13.0
    ## Protective-serv          18        1.8
    ## Sales                   130       13.0
    ## Tech-support             25        2.5
    ## Transport-moving         51        5.1

``` r
census2_freq <- census2$workclass        # For workclass
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##                  frequency percentage
    ## Federal-gov             23        2.3
    ## Local-gov               61        6.1
    ## Private                731       73.1
    ## Self-emp-inc            38        3.8
    ## Self-emp-not-inc        95        9.5
    ## State-gov               50        5.0
    ## Without-pay              2        0.2

``` r
census2_freq <- census2$education_level   # For education_level
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##              frequency percentage
    ## 10th                27        2.7
    ## 11th                35        3.5
    ## 12th                18        1.8
    ## 1st-4th              3        0.3
    ## 5th-6th             16        1.6
    ## 7th-8th             20        2.0
    ## 9th                 15        1.5
    ## Assoc-acdm          29        2.9
    ## Assoc-voc           44        4.4
    ## Bachelors          176       17.6
    ## Doctorate            6        0.6
    ## HS-grad            332       33.2
    ## Masters             52        5.2
    ## Preschool            6        0.6
    ## Prof-school         15        1.5
    ## Some-college       206       20.6

``` r
census2_freq <- census2$`marital-status`   # For marital_status
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##                       frequency percentage
    ## Divorced                    131       13.1
    ## Married-AF-spouse             1        0.1
    ## Married-civ-spouse          461       46.1
    ## Married-spouse-absent        21        2.1
    ## Never-married               322       32.2
    ## Separated                    29        2.9
    ## Widowed                      35        3.5

``` r
census2_freq <- census2$sex   # For sex
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##        frequency percentage
    ## Female       330         33
    ## Male         670         67

``` r
census2_freq <- census2$race   # For race
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##                    frequency percentage
    ## Amer-Indian-Eskimo        11        1.1
    ## Asian-Pac-Islander        29        2.9
    ## Black                    107       10.7
    ## Other                     11        1.1
    ## White                    842       84.2

``` r
census2_freq <- census2$`native-country`   # For native_country
cbind(frequency = table(census2_freq),
      percentage = prop.table(table(census2_freq)) * 100)
```

    ##                    frequency percentage
    ## Cambodia                   1        0.1
    ## Canada                     6        0.6
    ## China                      6        0.6
    ## Cuba                       5        0.5
    ## Dominican-Republic         3        0.3
    ## Ecuador                    2        0.2
    ## El-Salvador                3        0.3
    ## England                    3        0.3
    ## Germany                    4        0.4
    ## Guatemala                  2        0.2
    ## Haiti                      2        0.2
    ## Hungary                    1        0.1
    ## India                      6        0.6
    ## Italy                      2        0.2
    ## Jamaica                    2        0.2
    ## Japan                      2        0.2
    ## Mexico                    21        2.1
    ## Nicaragua                  3        0.3
    ## Philippines                3        0.3
    ## Poland                     2        0.2
    ## Portugal                   1        0.1
    ## Puerto-Rico                3        0.3
    ## South                      2        0.2
    ## Taiwan                     2        0.2
    ## Trinadad&Tobago            3        0.3
    ## United-States            903       90.3
    ## Vietnam                    3        0.3
    ## Yugoslavia                 4        0.4

## B.Measures of Central Tendency

Calculate the Mode

``` r
# For income
census2_income_mode <- names(table(census2$income))[      
  which(table(census2$income) == max(table(census2$income)))
]
print(census2_income_mode)
```

    ## [1] "<=50K"

``` r
# For age
census2_age_mode <- names(table(census2$age))[      
  which(table(census2$age) == max(table(census2$age)))
]
print(census2_age_mode)
```

    ## [1] "36"

## C. Measure of distribution of the data

### 1. Summary of Distribution

``` r
summary(census2)
```

    ##       age         workclass         education_level    education-num   
    ##  Min.   :17.00   Length:1000        Length:1000        Min.   : 1.000  
    ##  1st Qu.:28.00   Class :character   Class :character   1st Qu.: 9.000  
    ##  Median :38.00   Mode  :character   Mode  :character   Median :10.000  
    ##  Mean   :38.69                                         Mean   : 9.983  
    ##  3rd Qu.:47.00                                         3rd Qu.:12.000  
    ##  Max.   :78.00                                         Max.   :16.000  
    ##  marital-status      occupation        relationship           race          
    ##  Length:1000        Length:1000        Length:1000        Length:1000       
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##      sex             capital-gain    capital-loss     hours-per-week 
    ##  Length:1000        Min.   :    0   Min.   :   0.00   Min.   : 8.00  
    ##  Class :character   1st Qu.:    0   1st Qu.:   0.00   1st Qu.:40.00  
    ##  Mode  :character   Median :    0   Median :   0.00   Median :40.00  
    ##                     Mean   : 1097   Mean   :  85.46   Mean   :41.18  
    ##                     3rd Qu.:    0   3rd Qu.:   0.00   3rd Qu.:45.00  
    ##                     Max.   :99999   Max.   :2444.00   Max.   :99.00  
    ##  native-country        income         
    ##  Length:1000        Length:1000       
    ##  Class :character   Class :character  
    ##  Mode  :character   Mode  :character  
    ##                                       
    ##                                       
    ## 

### 2. Standard deviation

``` r
sapply(census2[,c(1,4,10,11,12)], sd)
```

    ##            age  education-num   capital-gain   capital-loss hours-per-week 
    ##      12.857592       2.623279    7480.249876     392.734211      11.945498

### 3. Measure of Variance

``` r
sapply(census[,c(1,4,10,11,12)], var)
```

    ##            age  education-num   capital-gain   capital-loss hours-per-week 
    ##   1.747121e+02   6.517202e+00   5.634649e+07   1.639894e+05   1.441803e+02

### 4. Measure of Kurtosis

capital-gain, capital-loss and hours-per-week have a high number of
outliers.

``` r
if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")
```

    ## Loading required package: e1071

``` r
sapply(census[,c(1,4,10,11,12)], kurtosis, type = 2)
```

    ##            age  education-num   capital-gain   capital-loss hours-per-week 
    ##     -0.1558745      0.6351236    150.1512923     19.3639695      3.2014249

### 5. Measure of Skewness

Skewness above 0.4 implies a positive skew; a right-skewed distribution.
(age, capital-gain, capital-loss)

Skewness below -0.4 implies a negative skew; a left-skewed
distribution.(hours-per-week)

``` r
sapply(census[,c(1,4,10,11,12)], skewness, type = 2)
```

    ##            age  education-num   capital-gain   capital-loss hours-per-week 
    ##      0.5328159     -0.3106209     11.7890022      4.5163042      0.3405451

## D. Measures of Relationship

### 1. Measure the covariance between variables

``` r
census2_cov <- cov(census2[, c(1,4,10,11,12)])
View(census2_cov)
```

### 2. Measure the correlation between variables

``` r
census2_cor <- cor(census2[, c(1,4,10,11,12)])
View(census2_cor) 
```

# Inferential Statistics

### ANOVA

Dependent variable: Income. Independent variables: age, workclass,
education_level, education-num, marital-status, occupation,
relationship, race, sex, capital-gain, capital-loss, hours-per-week,
native-country.

#### (i) One-Way ANOVA

``` r
result_one_way <- aov(`hours-per-week` ~ education_level, data = census2)
summary(result_one_way)
```

    ##                  Df Sum Sq Mean Sq F value   Pr(>F)    
    ## education_level  15   8177   545.1   3.992 4.54e-07 ***
    ## Residuals       984 134375   136.6                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#### (ii) Two-Way ANOVA

``` r
result_two_way <- aov(`hours-per-week` ~ education_level * `marital-status`, data = census2)
summary(result_two_way)
```

    ##                                   Df Sum Sq Mean Sq F value   Pr(>F)    
    ## education_level                   15   8177   545.1   4.236 1.19e-07 ***
    ## `marital-status`                   6   5278   879.6   6.836 4.12e-07 ***
    ## education_level:`marital-status`  49   9556   195.0   1.515    0.014 *  
    ## Residuals                        929 119542   128.7                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Basic Visualizations

## (i) Univariate Plots

### Histograms for Each Numeric Attribute

``` r
# Age
age <- as.numeric(unlist(census2[, 1]))
hist(age, main = names(census2)[1])
```

![](milestone1_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

``` r
# Education-num
`education-num` <- as.numeric(unlist(census2[, 4]))
hist(`education-num`, main = names(census2)[4])
```

![](milestone1_files/figure-gfm/unnamed-chunk-18-2.png)<!-- -->

``` r
# Capital-gain
`capital-gain` <- as.numeric(unlist(census2[, 10]))
hist(`capital-gain`, main = names(census2)[10])
```

![](milestone1_files/figure-gfm/unnamed-chunk-18-3.png)<!-- -->

``` r
# Capital-loss
`capital-loss` <- as.numeric(unlist(census2[, 11]))
hist(`capital-loss`, main = names(census2)[11])
```

![](milestone1_files/figure-gfm/unnamed-chunk-18-4.png)<!-- -->

``` r
# hours-per-week
`hours-per-week` <- as.numeric(unlist(census2[, 12]))
hist(`hours-per-week`, main = names(census2)[12])
```

![](milestone1_files/figure-gfm/unnamed-chunk-18-5.png)<!-- -->

### Box and Whisker Plots for Each Numeric Attribute

``` r
boxplot(census2[, 1], main = names(census2)[1])
```

![](milestone1_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->

``` r
boxplot(census2[, 4], main = names(census2)[4])
```

![](milestone1_files/figure-gfm/unnamed-chunk-19-2.png)<!-- -->

``` r
boxplot(census2[, 10], main = names(census2)[10])
```

![](milestone1_files/figure-gfm/unnamed-chunk-19-3.png)<!-- -->

``` r
boxplot(census2[, 11], main = names(census2)[11])
```

![](milestone1_files/figure-gfm/unnamed-chunk-19-4.png)<!-- -->

``` r
boxplot(census2[, 12], main = names(census2)[12])
```

![](milestone1_files/figure-gfm/unnamed-chunk-19-5.png)<!-- -->

### Bar Plots for Each Categorical Attribute

``` r
barplot(table(census2[, 2]), main = names(census2)[2])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

``` r
barplot(table(census2[, 3]), main = names(census2)[3])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-2.png)<!-- -->

``` r
barplot(table(census2[, 5]), main = names(census2)[5])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-3.png)<!-- -->

``` r
barplot(table(census2[, 6]), main = names(census2)[6])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-4.png)<!-- -->

``` r
barplot(table(census2[, 7]), main = names(census2)[7])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-5.png)<!-- -->

``` r
barplot(table(census2[, 8]), main = names(census2)[8])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-6.png)<!-- -->

``` r
barplot(table(census2[, 9]), main = names(census2)[9])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-7.png)<!-- -->

``` r
barplot(table(census2[, 13]), main = names(census2)[13])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-8.png)<!-- -->

``` r
barplot(table(census2[, 14]), main = names(census2)[14])
```

![](milestone1_files/figure-gfm/unnamed-chunk-20-9.png)<!-- -->

## (ii) Multivariate Plots

``` r
# ggplot
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")
```

    ## Loading required package: ggcorrplot

    ## Loading required package: ggplot2

``` r
# caret
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")
```

    ## Loading required package: caret

    ## Loading required package: lattice

``` r
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
```

#### Correlation Plot

``` r
ggcorrplot(cor(census2[,c(1,4,10,11,12)]))
```

![](milestone1_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

#### Create a Scatter Plot —-

``` r
pairs(~ age  + `education-num` + `hours-per-week`, data = census2, col = as.numeric(factor(census2$income)))
```

![](milestone1_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

``` r
# Alternatively, the ggcorrplot package can be used to make the plots more
# appealing:
ggplot(census2,
       aes(x = `hours-per-week`, y = `marital-status`, shape = income, color = income)) +
  geom_point() +
  geom_smooth(method = lm)
```

    ## `geom_smooth()` using formula = 'y ~ x'

    ## Warning in qt((1 - level)/2, df): NaNs produced

    ## Warning in max(ids, na.rm = TRUE): no non-missing arguments to max; returning
    ## -Inf

![](milestone1_files/figure-gfm/unnamed-chunk-23-2.png)<!-- -->

### Multivariate Box and Whisker Plots by Class

``` r
featurePlot(x = census2[, c(1,4,10,11,12)], y = census2[, 14], plot = "box")
```

    ## NULL
