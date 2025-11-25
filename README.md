## Analysis of BMI and Myocardial Infarction Risk Using the Framingham Heart Study
•⁠ Project: Data pipeline + Statistical Model with R

•⁠ Duration: Sep 2022 - Dec 2022

•⁠ Team Members: Lucas Li, Caleh Collins, Jake Golden, Parth Sharaff

***💻Background***

The project aims to study the association between BMI and being hospitalized for myocardial infarction (heart attack). 
A study in 2020 completed by European adults demonstrated that obesity (a BMI above 30) is implicated as a risk factor for heart attacks. Thus, we expect a positive association between higher BMI levels and higher hospitalization due to a
myocardial infarction. In other words, a higher BMI level will correlate with an increased number of individuals reporting being hospitalized due to heart attack. Given this study, we want to examine the association between BMI and being hospitalized for myocardial infarction.

***Hypothesis***

-Null Hypothesis:
There is no significant difference between BMI level and the rate of hospitalization due to myocardial infarction.

-Alternative Hypothesis:
There is a significant difference between BMI level and the rate of hospitalization due to myocardial infarction.

-Rationale:
Research indicates that European individuals with a higher level of BMI
are more likely to suffer from a heart attack (Adams, Jacocks, Guo 2020). Because our study is focusing on the Framingham population instead, we want to see if there is also a statistically significant difference.

***Variable of Interest***

BMI: A measurement of a person’s Body Mass Index (kg/m squared)
HOSPITAL_MI:	Categorical	Response	Hospitalized myocardial infarction (Yes or No)

***Recoding Procedures***

BMI: A measurement of a person's Body Mass Index, measured in kg/m squared.

BMI was originally a numerical variable, but we recoded it into "BMIlevels", which is a categorical variable.

New Categories:
Underweight: below 18.5
Healthy: greater than or equal to 18.5 but less than 25
Overweight: greater than or equal to 25 but less than 30
Obese: greater than or equal to 30.

No recoding was completed for the Hospital_MI variable as it was already categorized as a response of “yes” or “no”.

Rationale: Our rationale for recoding BMI was that we needed to categorize this numerical variable so that we could run statistical analysis tests on the proportion of individuals in each category that reported being hospitalized for a heart attack. Given that previous literature cites obesity as a risk factor for heart attack, we wanted to define what BMI levels fall into the range of obesity. Then, so that we could run a chi-squared test, we categorized other ranges of BMIs, as defined by the official BMI weight status categories (Center for Disease Control and Prevention, 2022).

***Chi-squared test***

Chi-squared test results indicate that there is an association between BMI levels and being hospitalized for myocardial infarction (χ2 = 10.618, p = 0.01398).

Thus, we reject the null hypothesis.

Individuals who are overweight or obese are more likely to be hospitalized (10.02% and 11.21%) as opposed to those who are healthy (8.55%). People with a BMI level that falls into the underweight category were least likely of being hospitalized for myocardial infarction (6.82%).

***Recoding Procedures***

No recoding was completed for the Hospital_MI variable as we still want to maintain a response variable of whether someone was hospitalized for myocardial infarction or not.
The BMIlevels variable was dichotomized as BMIlevels2 such that
The obese category remained the same
All other variables ("underweight", "healthy",
and "overweight") were collapsed into the category "other".
Rationale: Given that our research question is examining if obesity
is a risk-factor for heart attack, we want to run a 2-sample Z test that compares obese individuals and non-obese individuals and their hospitalization rates due to myocardial infarction.

***Results: 2-Sample Z Test***

Results from the 2-sample z test demonstrate a correlation between a high BMI level and hospitalization for myocardial infarction (χ2 = 4.8386, Z = 2.199682, p = 0.02783).

People who having a higher BMI level (obese) are more likely to be hospitalized (11.21%) as opposed to those who have a lower BMI level (9.23%).

***Discussion***

Across both the Chi-squared Test and 2-Sample Z Test, we find that there is a statistically significant difference between BMI level and the rate of hospitalization due to myocardial infarction. We found that there is a positive association between BMI level and rate of hospitalization due to heart attack, meaning that as BMI levels increase, a significantly higher proportion of the sample reports being hospitalized for heart attack. Furthermore, we also found in our 2-Sample Z Test, that a significantly higher proportion of individuals who are obese report being hospitalized for myocardial infarction than non-obese individuals. This supports previous literature, which cites obesity as a risk factor for heart attack.

While our data is statistically significant, with both statistical analyses yielding a p-value of less than 0.05, it should be noted that the data from the previous study resulted in a p-value of 0.001, meaning the study of European adults provided more evidence against the null hypothesis. This could be due to the fact that a population of 322,154 individuals was studied, while this study only contains 9,094 observations. This could also be due to the fact that this was a study of European adults, while our study examines a similar relationship but in adults from Framingham, Massachusetts.

***Work Cited***

Adams B, Jacocks L, Guo H. 2020. "Higher BMI is linked to an increased risk of heart attacks in European adults: a Mendelian randomisation study". BMC
Cardiovasc Disord. Higher BMI is linked to an increased risk of heart attacks in European adults: a Mendelian randomisation study - PMC (nih.gov)

Center for Disease Control and Prevention. 2022. "About Adult BMI". CDC Healthy Weight, Nutrition,
and Physical Activity. About Adult BMI | Healthy Weight, Nutrition, and Physical Activity | CDC

