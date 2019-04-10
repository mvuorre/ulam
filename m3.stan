data {
  int N;
  vector[N] y;
  vector[N] x;
}

parameters {
  real b0;
  real b1;
  real t0;
  real t1;
}

model {
  vector[N] mu;
  vector[N] sigma;
  
  b0 ~ normal(0, 10);
  b1 ~ normal(0, 5);
  t0 ~ cauchy(0, 10);
  t1 ~ cauchy(0, 5);
  
  for (n in 1:N) {
    mu[n] = b0 + b1*x[n];
    sigma[n] = exp(t0 + t1*x[n]);
    y[n] ~ normal(mu[n], sigma[n]);
  }
}

generated quantities {
  // Transform t0 and t1 to standard deviations of each drug
  real sigma_Da = exp(t0);
  real sigma_Db = exp(t0 + t1);
}
