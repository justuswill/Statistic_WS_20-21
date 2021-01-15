# install.packages("compositions")
library("compositions")

gaus_test <- function(M, N, alpha){
  # frequencies of false rejection
  rel = c()
  for(n in N){
    # p-values
    p = c()
    for(i in 1:M){
      X = rnorm(n, sd=10)
      p = c(p, Gauss.test(X, mean=0, sd=10, alternative="two.sided")$p.value)
    }
    rel = c(rel, mean(p < alpha))
  }
  plot(N, 100 * rel, type="l", xlab="N", ylab="False Rejections [ in %]", col="dodgerblue",
       main=sprintf("Two-Sided Gaustest (alpha = %g)", alpha))
}

Ns = seq(10, 200, 10)
for(alpha in c(0.01, 0.5, 0.1)){
  gaus_test(500, Ns, alpha)
}