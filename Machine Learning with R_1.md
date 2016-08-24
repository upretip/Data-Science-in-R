Machine Learning with R_1
========================================================
author: Parash Upreti
date: 
autosize: true

Machine learning Classification Problems
========================================================
- This presentation covers the ways to create a machine learnining algorithm to classify cancerous cells. We will use differnt techniques and measure the accuracy of the prediction using each models. 

- The dataset comes from UCI Machine Learning Recipotary. You can read about the dataset in the website. http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29


- Please note that this data is already cleaned and ready for use. So a majority of work is already done. Now we will use this data and predict if our algorithms can correctly classify.

- We will use multiple supervised vs unsupervised methods for classification

- Lets get started

Importing and Looking at the dataset
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](Machine Learning with R_1-figure/unnamed-chunk-2-1.png)
