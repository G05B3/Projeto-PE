set.seed(786)
m = 1500
n = 1255
lambda = 2.28
x = 0
for (i in 1:m){
  x[i] = mean(rexp(n,lambda))
}
gama = 0.98
b = qnorm((1+gama)/2)
amplitude = (2*b)/(x*sqrt(n))
result = mean(amplitude)
result