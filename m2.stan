data {
  int N;
  vector[N] y;
  vector[N] x;
}

parameters {
  real b0;
  real b1;
  real<lower=0> sigma;
}

model {
  vector[N] mu;
  
  b0 ~ normal(0, 10);
  b1 ~ normal(0, 5);
  sigma ~ cauchy(0, 10);
  
  for (n in 1:N) {
    mu[n] = b0 + b1*x[n]; // mu changes for each obs
    y[n] ~ normal(mu[n], sigma); // likelihood for single obs
  }
}
