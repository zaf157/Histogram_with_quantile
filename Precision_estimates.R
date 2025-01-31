install.packages("mosaic")
library(mosaic)

set.seed(21)
sample1= rnorm(150,20,5)
# simulate a sample
# do bootstrap resampling, sampling with replacement
boot.means=do(1000) * mean(resample(sample1))
# get percentiles from the bootstrap means
q=quantile(boot.means[,1],p=c(0.025,0.975))
# plot the histogram
hist(boot.means[,1],col="steelblue",border="white",
     xlab="sample means", main = "Histogram")
abline(v=c(q[1], q[2] ),col="red")
text(x=q[1],y=200,round(q[1],3),adj=c(1,0))
text(x=q[2],y=200,round(q[2],3),adj=c(0,0))
title(main = "histogram")

ggsave("histogram.png")
