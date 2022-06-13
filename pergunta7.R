seed = 164
amostras = 6415
dim = 150
n = 35
p = 0.84
set.seed(seed)

for (i in 1:amostras)
{
  z = rbinom(dim,n,p)
  
  y = mean(z)
  if (i == 1)
    x = y
  else
    x = c(x,y)
}
x = mean(x)
E_teor = n*p

print(x - E_teor)