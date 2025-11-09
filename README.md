🎲Decision Theory Mini-Analysis 🎲

A small simulation in R exploring how people make decisions under risk.

💡Overview
This project models decision-making using simple gambles to compare the expected value (Rational) and the risk-adjusted value (Psychological).  

It explores the basic principles of decision theory, cognitive bias and quantitative reasoning. 

🔨Methods
- Simulated 20 participants choosing between a higher risk vs lower risk safe option
- Calculated expected values (EV) and optimal decisions
- Compared actual choices vs rational choices  
- Visualised decision accuracy and risk-adjusted value relationships  

📈 Results & Visualisation
The dataset modelled 20 participants making binary risky vs safe decisions under uncertainty, with limited sensitivity to expected value differences. 
- Accuracy Rate: 0.4
- Average EV Difference: 27.6 

Finding 1: Suboptimal Decision Accuracy 
- Participants selected the higher value option in 40% of trials,  departing from rational choice models 
- This suggests random decision-making or subjective probability weighing
<img width="1174" height="851" alt="Decision Accuracy vs Expected Value Plot" src="https://github.com/user-attachments/assets/4bf51d57-fc05-45a0-8288-c048c0e808be" />


Finding 2: Non-linear Risk Adjustment 
- Risk-adjusted valuations fell below their rational expected values 
- Consistent with risk-averse behaviour
<img width="1128" height="851" alt="Risk-adjusted vs Expected Value Plot" src="https://github.com/user-attachments/assets/5b15751b-67ac-4326-9cec-274e6f991a39" />


🧠 Insights
Participants demonstrated probability weighting consistent with cognitive bias, particularly underweighting moderate probabilities and overweighing small ones.

🧰 Built with 
- R
- Tidyverse (ggplot2, dplyr, tibble)
