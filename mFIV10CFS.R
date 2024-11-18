################################################################################
# Description: mFI-v10 for moderate to severe frailty classification in CFS
# Algorithm: logistic regression 
# Version: 1.0
# Lab version: beta 1.0
# Created: 2024/11/18
################################################################################

################################################################################
# Example data
################################################################################

sample_size <- 30

set.seed(0)

age <- rnorm(sample_size, mean = 50, sd = 10)
gender <- rbinom(sample_size, size = 1, p = 0.5)

x <- rnorm(sample_size, mean =  0.01, sd = 0.1)
mFI_v10 <- pnorm(x, mean = mean(x), sd = sd(x))

data <- data.frame(age, gender, mFI_v10)


################################################################################
# risk of moderate to severe frailty classification
################################################################################


mFIV10CFS <- function(data){
  model <- -8.24+0.08*data[,"age"]-0.44*data[,"gender"]+9.38*data[,"mFI_v10"]
  prob <- exp(model)/(1+exp(model))
  prob_threshold <- ifelse(prob>0.29,1,0)
  data_df <- data.frame(data, prob, prob_threshold)
  return(data_df)
}

output <- mFIV10CFS(data = data)


