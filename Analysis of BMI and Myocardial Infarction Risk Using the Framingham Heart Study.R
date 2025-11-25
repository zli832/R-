##################################
#Document Name: Analysis of BMI and Myocardial Infarction Risk Using the Framingham Heart Study
#Authors: Lucas Li, Caleh Collins, Jake Golden, Parth Sharaff
##################################

#We converted the excel spreadsheet into a csv file because we were more familiar with this file type.

#Set working directory and assign data to a variable
setwd("/Users/jakegolden/Documents/QTM 100/QTM Datasets")
framingham <- read.csv("framingham.csv", header = T) #Read data and put into variable
framingham[framingham$BMI == ".",]$BMI <- NA #Re-coding the periods to NA's

#1-------------------------------------
#Choosing our dichotomous  categorical  variable
#--------------------------------------
# HOSPITAL_MI : Whether someone reported a Hospitalized myocardial infarction (either a 'yes' or 'no')

#2-------------------------------------
#Choosing our categorical explanatory variable (3-8 levels)
#--------------------------------------
# BMI : A person's body mass index in kg/m squared
#Putting people's BMI's into levels based off of research
framingham$BMIlevels <- factor(NA, levels = c("underweight", "healthy", "overweight", 
                                             "obese"))
framingham$BMIlevels[framingham$BMI < 18.5] <- "underweight"
framingham$BMIlevels[framingham$BMI >= 18.5 & framingham$BMI < 25] <- "healthy"
framingham$BMIlevels[framingham$BMI >= 25 & framingham$BMI < 30] <- "overweight"
framingham$BMIlevels[framingham$BMI >= 30] <- "obese"
framingham$BMIlevels #view the coding for the new variable


#3-------------------------------------
#Reporting our chosen variables
#--------------------------------------
# We have chosen to use the HOSPITAL_MI and BMI variables to answer our research question. 
#The HOSPITAL_MI variable is a dichotomous categorical variable that represents whether or not a 
#person reported a hospitalized myocardial infarction (heart attack). The BMI variable is a numerical 
#variable that will be categorized into 5 different levels (underweight, healthy, overweight, obese, 
#and clinically obese). The BMI variable represents the explanatory variable while the HOSPITAL_MI 
#variable represents the response variable.

#4-------------------------------------
#Research Question & Explanation
#--------------------------------------
#What is the association between BMI and being hospitalized for myocardial infarction (heart attack)?

# A study in 2020 completed by European adults demonstrated that obesity (a BMI above 30) is implicated
#as a risk factor for heart attacks. Thus, we expect a positive association between higher BMI levels
#and higher hospitalization due to a myocardial infarction. In other words, a highr BMI level will
#correlate with an increased number of individuals reporting being hospitalized due to heart attack.
#Given this study, we want to examine the association between BMI and being hospitalized for 
#myocardial infarcton. 

#5-------------------------------------
#Plot to visualize the two variables
#--------------------------------------
#Stacked bar plot for BMI with 4 categories
x <- ggplot(na.omit(framingham)) +
  geom_bar(aes(x = BMIlevels, fill = HOSPITAL_MI), position = "fill") +
  labs(title = "Comparing BMI Level to Hospitalization for Myocardial Infarction", x = "BMI Levels", y = "Proportion")
x


#6-------------------------------------
#A chi-square analysis
#--------------------------------------
#Stating null and alternative hypothesis
# H0: There is no significant difference between BMI level and the rate of hospitalization 
#     due to myocardial infarction
# HA: There is a significant difference between BMI level and the rate of hospitalization 
#     due to myocardial infarction
BMIlevelstable <- table(framingham$BMIlevels, framingham$HOSPITAL_MI) #Table of frequencies
colnames(BMIlevelstable) = c("No hospitalization", "Yes hospitalization") #column names to read table easier
BMIlevelstable #Viewing the table of expected cell counts
addmargins(BMIlevelstable) #Adding a summary margin
prop.table(BMIlevelstable, margin = 1) #Calculate proportions of the rows
chisq.test(BMIlevelstable, correct = F) #(χ2 = 10.618, p = 0.01398)
#These findings agree with our hypothesis and are both practically and statistically significant.
# Since the p value is less than our significance level of 0.05, we can say that our hypothesis is 
# supported. Additionally, it is practical to say that a person with a higher BMI is more likely to
# suffer from a heart attack. 


#7-------------------------------------
#Performing 2-sample z-tests
#--------------------------------------
#Dichotomizing the categorical value into 2 variables
#Comparing "obese" individuals with "others" representing everyone else

#Re-coding new levels with obese and everything esle as the two categories
framingham$BMIlevels2 <-factor(NA, levels=c("obese", "other"))
framingham$BMIlevels2[framingham$BMIlevels=="obese"]<-"obese"
framingham$BMIlevels2[framingham$BMIlevels!= "obese"]<- "other"

#Stacked bar plot showing obese compared to everything else
y <- ggplot(na.omit(framingham)) +
  geom_bar(aes(x = BMIlevels2, fill = HOSPITAL_MI), position = "fill") +
  labs(title = "Comparing Hospitalizations for BMI Level Obese to All Other Levels", x = "BMI Levels", y = "Proportion")
y

#create frequency table
BMI_HospitalMI_Table <- table(framingham$BMIlevels2,framingham$HOSPITAL_MI)

#view table
BMI_HospitalMI_Table

#add summary margins
addmargins(BMI_HospitalMI_Table)

prop.table(BMI_HospitalMI_Table, margin=1)

#Run two sample z test
prop.test(BMI_HospitalMI_Table, correct=F) 
# looking for response variable in which "yes, hospitalized" so must be reordered

prop.test(c(137, 723), c(1222, 7835), correct=F)
# reordered two sample z test such that the response was yes hospitalized
#Obtained a p-value of 0.02783, demonstrating that there is a significant difference
#between the number of individuals who are obese and hospitalized for heart attack 
#and number of individuals who are not obese and hospitalized for heart attack
#we can therefore reject the null hypothesis that there is no significant difference


