data {
  int N;
  vector[N] y;
  vector[N] x;
}

parameters {
  real mu;
  real<lower=0> sigma;
}

model {
  // Priors count once towards log posterior
  mu ~ normal(0, 10);
  sigma ~ cauchy(0, 10);
  
  // Likelihood counts N times
  for (n in 1:N) {
    y[n] ~ normal(mu, sigma);
    // Equivalent statements of whats going on here:
    // target += normal_lpdf( y[n] | mu, sigma);
    // increment_log_prob(normal_log(y[n], mu, sigma));
    
  }
  // Vectorized version
  // y ~ normal(mu, sigma);
}
