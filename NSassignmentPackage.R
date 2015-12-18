add2 <- function(x=0,y=0){
  x+y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

aboveN <- function(x,n=3) {
  use <- x > n
  x[use]
}

columnMean<-function(m, removeNA=TRUE) {
  nc<-ncol(m)
  means<-numeric(nc)
  for(i in 1:nc) {
    means[i]<-mean(m[,i],na.rm=removeNA)
  }
  means
}