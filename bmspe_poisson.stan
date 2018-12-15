data {
    /* Hyperparameters*/
    real<lower=0> alpha;
    real<lower=0> beta;

    /* Sample size */
    int<lower=0> N;
    /* Design Matrix */
    matrix[N,M] X;
    /* Outcome (a real vector of length n) */
    int<lower=0> y[N];
}

parameters {
    real<lower=0> lambda;
}

model {
    /* Prior */
    /* lambda ~ gamma(alpha, beta); */
    /* Explicit contribution to target */
    target += gamma_lpdf(lambda | alpha, beta);

    /* Likelihood */
    /* y ~ poisson(lambda); */
    /* Explicit contribution to target */
    for (i in 1:N) {
        target += poisson_lpmf(y[i] | lambda);
    }
}
