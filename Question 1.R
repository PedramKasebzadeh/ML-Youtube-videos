data<- read.csv('video.csv')
 yt <-data


n <- dim(yt)[1] 
id <- sample(1:n,floor(n*0.5))
test <- yt[id,]
train <- yt[-id,]
trainmat <- as.matrix(train[,-c(2,19)])


PCA <- prcomp((trainmat),scale. = TRUE)
plot(PCA$x[,1],PCA$x[,2])
pcavar <- PCA$sdev^2
pcavarper <- round(100*pcavar/sum(pcavar),1)
barplot(pcavarper)
summary(PCA)

library(ggplot2)
pcadata <- data.frame(Sample=rownames(PCA$x),X=PCA$x[,1],Y=PCA$x[,2])
ggplot(pcadata,aes(x=X,y=Y,label=Sample))+
  geom_text()+
  xlab(paste('PCA1 - ',pcavarper[1],'%',sep=''))+
  ylab(paste('PCA2 - ',pcavarper[2],'%',sep=''))+
  theme_bw()+
  ggtitle('my pca plot')





####

data2 <- t(apply(as.matrix(yt[1:100,-c(2,19)]),1,combn,3,prod))

library(pamr)
