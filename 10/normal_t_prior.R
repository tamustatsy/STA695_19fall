#normal model with t prior  

#rejection sampling
y <- 2 # fake data
num_trials <- 1000
theta_proposals <- rt(num_trials, 1)
us <- runif(num_trials, min = 0, max = 1) 
log_accept_prob <- function(theta){
  -.5*(y - theta)^2 }
probs <- exp(log_accept_prob(theta_proposals))
accepts <- us < probs
hist(theta_proposals[accepts]) # only the accepted draws 
hist(theta_proposals) # all draws!


#importance sampling estimate of posterior mean of theta
y <- 2 # fake data
num_samples <- 1000000
theta_draws <- rt(num_samples , 1) 
log_unnorm_weight <- function(theta){
  # can ignore sqrt(2pi) because it will cancel out
  -.5*(y - theta)^2 }
lunws <- log_unnorm_weight(theta_draws) 
norm_weights <- exp(lunws)/sum(exp(lunws)) 
sum(norm_weights * theta_draws) 
hist(norm_weights)


#calculating effective sample size
ESS <- 1/sum(norm_weights^2)
ESS

#graphical check of accuracy 
hist(
  replicate(1000,
            getISEstimator(num_samps_per_estimate)$estimate), xlab = "IS estimate",
  main = "distribution of IS estimate")

#estimate the standard errors 
getISEstimator <- function(num_samples){
  theta_draws <- rt(num_samples, 1)
  lunws <- log_unnorm_weight(theta_draws) 
  norm_weights <- exp(lunws)/sum(exp(lunws)) 
  estimator <- sum(norm_weights * theta_draws) 
  list("estimate" = estimator,
       "approx_var" = sum( norm_weights^2*(theta_draws - estimator)^2) ) }


#two way of estimating standard errors
num_samps_per_estimate <- 10 
sqrt(getISEstimator(num_samps_per_estimate)$approx_var) 
sd(replicate(1000, getISEstimator(num_samps_per_estimate)$estimate))


  
