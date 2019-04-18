yt <- read.csv2('video.csv')


n <- dim(yt)[1] 
id <- sample(1:n,floor(n*0.5))
test <- yt[id,]
train <- yt[-id,]
