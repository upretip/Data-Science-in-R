R Tutorial 101: Basic Introduction to R
========================================================
author: Parash Upreti 
date: 
autosize: true



.

Disclaimer: Most of the information may seem basic but I recommend quickly trying the codes and rejuvinating rusty skills.

Overview
========================================================
This is a very basic R Tutorial and assumes that you have a very little or no previous R knowledge. You can easily follow the slides with R your local installation of the software. Topics here include:

- Getting Started with R 
- Working on R
- Workspace
- Commenting R Code
- Working Directory
- Working with data
- Vectors, list and Matrices
- R Data Structures
- Logical Operators and Truth values
- Programming in R
- Functions and packages


Getting Started with R
========================================================


- R is a statistical and mathematical computational software. It is available free of cost here [https://cran.r-project.org/bin/windows/base/].

- The popular IDE for R is RStudio which can be downloaded for free as well here [https://www.rstudio.com/products/RStudio/] Choose the desktop version.

- In RStudio, you will be working on either console or script windows. Inputs can be inserted in both windows but Console is where your results are displayed. 

- RStudio is nicer since you can see two additional windows which can be helpful in many ways.

Lets Start working on R
========================================================

Do the following. Write type the following lines on your R script and hit  ` control + enter` (there are other ways to run code in R)  :


```r
1+3*3
```


```r
3**5  
3^5
```
As you can see, R has a intreprative command line. It can easily perform basic arithematic operations. Try some other calculations. (Note, you can directly run code in console)

Working on R
======================================================

Also, you can assign values to a variable we will use `"<-"` to assign values. (Can also use `"="` but we try to avoid.) 


```r
x<- 7
x
```

```
[1] 7
```

```r
y<- 3^2
x + y
```

```
[1] 16
```
If you check on the window to your right on the environment tab, aka workspace, you will see `x` and `y` as values. You can check what is on your workspace by `ls()`


Altering the workspace
=====================================
- You can alter the workspace by reassigning the value


```r
x<- 1000
x<- x *3
x
```

```
[1] 3000
```
- You can also remove a particular value by 


```r
rm(x)
```
- OR

```r
remove(y)
```

Commenting the code
========================================================
- Commenting is the most important part of writing code. Comments can be useful to give instructions or explain what particular line of code does. 

- In R, you can write comments by beginning the line with ` # ` 

```r
# The following code adds two numbers

3+5    # 3 (first number) comes from x values and 5 (second) from y
```

```
[1] 8
```
The code runs with the command (which is ignored by R)

- If you need to clear your console you can press `cltr + l`. It clears the texts from the console but not from the workspace. 

Working directory
========================================================
Working directory is the location on your hard drive thar R is currently accessing. This can be changed anytime. In RStudio, you can see this on the bottom right window under files tab.

```r
#getting current working directory
getwd()
```

```
[1] "C:/Users/Machine/Documents/R/R Tutorial"
```
- Set working directory by: `setwd(#location on your computer)`
- Can also view the working directory by: 

```r
dir()
```

```
[1] "Data manupulation Presentation.Rmd" 
[2] "Data_manupulation_Presentation.html"
[3] "R Tutorial.Rproj"                   
[4] "R_Tutorial Presentation-figure"     
[5] "R_Tutorial Presentation.html"       
[6] "R_Tutorial Presentation.Rpres"      
[7] "R_Tutorial_Presentation.html"       
```

Working with data
========================================================
Data in R is in a vector form (for now). Concatinate (`c`) numbers as entries of vectors:

```r
x<- c(1,3,7,2,9,5)
y<- c(12,9,11, 14,7)
```
Check sombe basic information about your data

```r
length(x)
```

```
[1] 6
```

```r
length(c(x,y))
```

```
[1] 11
```

Working with data
=======================================================
- Select particular data point in your vector

```r
x[5]
```

```
[1] 9
```
- Or remove a particular value 

```r
y[-2]
```

```
[1] 12 11 14  7
```
- Change value or even add extra datapoints

```r
y[2] <- 10
y[6] <- 13 #earlier y only had 6 data points
```
Merging two vectors
========================================================
More on this later but just an example of what can be done with vectors


```r
xycol<- cbind(x,y) # x and y have to be same length
xycol
```

```
     x  y
[1,] 1 12
[2,] 3 10
[3,] 7 11
[4,] 2 14
[5,] 9  7
[6,] 5 13
```

```r
xyrow<- rbind (x,y)
xyrow
```

```
  [,1] [,2] [,3] [,4] [,5] [,6]
x    1    3    7    2    9    5
y   12   10   11   14    7   13
```
Create a list
=======================================================
Check to see what `list` does

```r
list(4,3)
first_list<- list(xcol =x,ycol=y)
first_list
```
Notice the difference of the

```r
first_list[2]
```

```
$ycol
[1] 12 10 11 14  7 13
```

```r
first_list[[2]]
```

```
[1] 12 10 11 14  7 13
```

Matrices 
========================================================

```r
X= matrix(c(1,2,4,2,2,3,2,1,2,4,2,4,1,3,4), ncol= 5, byrow =T)
X
```

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    2    4    2    2
[2,]    3    2    1    2    4
[3,]    2    4    1    3    4
```
By default, matrix is arranged by column. Also, you need to assign the number of columns (or rows).
Like vectors, matrix elements can be located or parsed by using:


```r
X[ ,3 ]   #First entry is row and second is column index
```

```
[1] 4 1 1
```

```r
X[2,3]
```

```
[1] 1
```

Table
==========================================================
Table commands tabulates the instances of each datapoint occurances

```r
table(c(1,2,4,2,2,3,2,1,2,4,2,4,1,3,4))
```

```

1 2 3 4 
3 6 2 4 
```

```r
prop.table(table(X)) # converts the counts into probability
```

```
X
        1         2         3         4 
0.2000000 0.4000000 0.1333333 0.2666667 
```

R Data Structure
==========================================================
R data comes in following formats:
- Numeric/Integers: Numeric values including integers and decimals

- Strings         : Characters, (exclude if they are factors)

- Factors         : Levels of classification. Eg. male/female, red/yellow/blue, etc

- Boolean         : True/False (assigns 1 for true and 0 for false). Can add/subtract boolean in R

- Date/Time       : Self explanatory. Try `sys.date()` and `sys.time()` 

Operation on Matrices
========================================================
R can perform matrix operations. Try the following on your console


```r
x<-1:3
y<-4:6
z<-7:9
M<-cbind(x,y,z)
N<-matrix(c(10,11,12,50,51,52),3,2,byrow='true')
```

Verify the following:


```r
dim(N)      #Returns the dimensions of N. 
dim(N)[1]   #Number of rows in N.
dim(N)[2]   #Number of cols in N.
```

Operation on Matrices
========================================================
Try the following codes: Comments are provided as hints


```r
M*M         #Elementwise multiplication
M%*%N       #Matrix multiplication
M^2         #Square each element
N+7         #Add 7 to each element of M
M%*%M       #Square M using matrix multiplication
t(M)        #Transpose of A
diag(M)     #Returns the diagonal of M as a vector.
diag(3)     #Creates the 3x3 identity matrix.
```
Try creating more matrices and try other operations

What does following command do? 

```r
M^(-1)
```

Matrices "solve" command 
=======================================================
What does the following "solve" command do?


```r
A<- matrix(c(2,3,4,2), nrow =2)
solve(A)
```
- Hint: Try Solve command for a non- square matrix. Try it again for matrix M

More solve:


```r
solve(A)%*%A
B =solve(A,diag(2))  #remember what diag(2) does?
B                    #What is B?
```
- More hint: solve is solving something. Matrix multiply A and B to find out. Shouldn't be that hard.

`A^(-1)` is not same as `solve(A)`

Logical Operators
===========================================================

These are equivalent to your true false statements. 
- Equal ==   [careful here, double equal sign]
- Not equal !=
- Greater than/equal >/>=
- Less than/ equal </<=


Run the code and see the results.

```r
3==7  
3!=7
3<7
3<=7
x=1:10
x==7
x<=7
x[x<=7]  #Understand this line of code please
```
More Logical Operators
==========================================================
- And [`&`] -- Or [`|`] -- Not [`!`]

Does the word "truth table " ring a bell?

```r
TRUE & FALSE
```

```
[1] FALSE
```

```r
TRUE | FALSE
```

```
[1] TRUE
```

```r
!TRUE
```

```
[1] FALSE
```
Truth Table
=======================================================

```r
P = c(TRUE, TRUE, FALSE, FALSE)
Q = c(TRUE, FALSE, FALSE, TRUE)

cbind(P, Q, "P&Q"= P&Q, "P_or_Q" = P|Q, "Not_P" =!P)
```

```
         P     Q   P&Q P_or_Q Not_P
[1,]  TRUE  TRUE  TRUE   TRUE FALSE
[2,]  TRUE FALSE FALSE   TRUE FALSE
[3,] FALSE FALSE FALSE  FALSE  TRUE
[4,] FALSE  TRUE FALSE   TRUE  TRUE
```
Programming in R
======================================================
If else statements in R


```r
if(5>1){print('Yes, it is.')}
```

```
[1] "Yes, it is."
```

```r
if(5>1){print('Yes, it is.')}else{print('No, it is not')}
```

```
[1] "Yes, it is."
```

```r
if(5==1){print('Yes, it is.')}else{print('No, it is not')}
```

```
[1] "No, it is not"
```

Using a Function
======================================================
We have already used many functions available in R.
- functions are in the form `function()` such as `cbind()` or `matrix()`
- such functions are available in `R base` integrated in plain R
- thre are many statistical functions in R such as `mean()`, `median()`, etc. (more on this later)
- you can create your own function as well. For eg. 


```r
operation<- function(x,y){
  sumops= x+y
  difops= x-y
  prodops=x*y
  quotops=x/y
  list(sum =sumops, diff = difops, prod = prodops, quot = quotops)
}
operation(3,22)$sum
```

```
[1] 25
```

Introuction to Statistical Functions
================================================================
R is equipped with many statistical functions. Other functions will be introduced as we move forward

```r
normal_data =rnorm(1000,100,15)  #sample of size 1000 from a normal distribution with mu=100 and sigma=15
mean(normal_data)   #Computes the sample mean.
```

```
[1] 99.82245
```

```r
sd(normal_data)     #Computes the sample st dev.
```

```
[1] 15.12774
```

```r
sum(normal_data)    #Computes the sum of the elements of x.
```

```
[1] 99822.45
```

R Packages
========================================================
Since R is an open source software and many users in the community are contributing, it is growing. R packages are developed by a variety of people in the community, academia, industry, and software companies and storing them in CRAN repositories, GitHub or on some websites. R packages could be thought of as functions created by others that are not already availabe in base R.

So they have to be installed in the machine using `install.packages("package_name")` (only once) and then called in before every section using `library(package_name)`

Example of R pacakges:

- ggplot
- e1071

we will discuss packages and their use in the future

Up Next
========================================================
- Using dataset
- Dataset available in R base
- Plots


