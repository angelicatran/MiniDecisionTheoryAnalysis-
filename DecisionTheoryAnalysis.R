#Loadings
install.packages("tidyverse")
library(tidyverse)
set.seed(100)

#Simulation of parameters
data <- tibble(
  participant = 1:20,
  prob_high = runif(20, 0.1, 0.9),        
  reward_high = runif(20, 50, 150),       
  reward_low = runif(20, 10, 50)
  )

#Simulation of participant choices (1= risky, 0=safe)
data <- data %>%
  mutate(choice_high=rbinom(20,1,0.5)
         )

#Expected value calc
data <- data %>%
  mutate(
    EV_high = prob_high * reward_high,
    EV_low = reward_low,
    optimal_choice = ifelse(EV_high > EV_low, 1, 0),
    decision_correct = ifelse(choice_high == optimal_choice, 1, 0)
    )

#Summary of Stats 
summary_stats <- data %>%
  summarise(
    accuracy_rate = mean(decision_correct),
    avg_EV_diff = mean(abs(EV_high - EV_low))
  )

print(summary_stats)

#Visualisation: Decision Accuracy 
print(ggplot(data, aes(x = factor(decision_correct))) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Decision Accuracy vs Expected Value",
    x = "Rational Decision (1 = Yes, 0 = No)",
    y = "Number of Participants"
  ) +
  theme_minimal())

#Risk-adjusted return function 
risk_adjusted_return <- function(prob, reward, risk_aversion = 1.2){
  return((prob * reward)^(1 / risk_aversion))
}

data <- data %>%
  mutate(risk_adj_high = risk_adjusted_return(prob_high, reward_high)
         )

#Visualisation: Risk-adjusted vs expect value
print(ggplot(data, aes(x = EV_high, y = risk_adj_high)) +
  geom_point(color = "tomato") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  labs(
    title = "Risk-Adjusted vs Expected Value",
    x = "Expected Value (Rational)",
    y = "Risk-Adjusted Value (Psychological)"
  ) +
  theme_minimal())
