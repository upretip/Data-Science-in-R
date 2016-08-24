
Gaussian EM Clustering
```{r,fig=T}
library(mixtools)
mydata.gauss=mvnormalmixEM(mydata,k=2)

#Posterior probabilities and clusters
#mydata.gauss$posterior
mydata.cluster=apply(mydata.gauss$posterior,
                     1,
                     which.max)
plot(mydata,col=mydata.cluster)


#Prior probabilities (also called mixing probabilities)
mydata.gauss$lambda

#Means for each cluster
mydata.gauss$mu

points(rbind(mydata.gauss$mu[[1]],
             mydata.gauss$mu[[2]]),
       pch=24,bg='blue',col="blue")


#Covariance matrices for each cluster
mydata.gauss$sigma
Sigma1
Sigma2
```

## Gaussian clustering for iris data

Standardizing iris

```{r, fig=T}
x=iris[,1:4]
xbar=apply(x,2,mean)
xbarMatrix=cbind(rep(1,150))%*%xbar
s=apply(x,2,sd)
sMatrix=cbind(rep(1,150))%*%s

z=(x-xbarMatrix)/sMatrix
apply(z,2,mean)
apply(z,2,sd)

plot(z[,3:4],col=iris$Species)


#Silhouette Coefficient
library(cluster)
library(fields)

mysil=function(x,dmatrix){
  return(mean(silhouette(x=x,dmatrix=dmatrix)[,3]))
}

plot.sil=function(data,max.K,dmatrix){
  sil.vect=1:max.K
  for(K in 2:max.K){
    data.gauss=mvnormalmixEM(data,k=K)
    cluster=apply(data.gauss$posterior,
                  1,
                  which.max)
    sil.vect[K]=mysil(cluster,dmatrix)
  }
  sil.vect=sil.vect[2:max.K]
  plot(2:max.K,sil.vect,xlab="K",ylab="Silhouette Coefficient")
  return(max(sil.vect))
}

dmatrix=rdist(z)
plot.sil(z,5,dmatrix)


#Gaussian clustering with k=2

iris.gauss=mvnormalmixEM(z,k=2)


#Posterior probabilities and clusters
iris.gauss$posterior
iris.cluster=apply(iris.gauss$posterior,
                     1,
                     which.max)
plot(z[,3:4],col=iris.cluster)

plot(z,col=iris.cluster)


#Prior probabilities
iris.gauss$lambda


#Means for each cluster
iris.gauss$mu


#Covariance matrices for each cluster
iris.gauss$sigma
```

