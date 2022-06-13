seed = 878
lambda = 0.27
n = 685
higher = 1
set.seed(seed)

amostra = rexp(n,lambda)
print(amostra)
teorico = 1 - pexp(higher,lambda)
count <- 0
for (i in 1:n){
  if (amostra[i] > higher) count = count + 1
}
amostra = count/n
print(amostra)
print(teorico)
print(teorico-amostra)