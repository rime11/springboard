![cover_photo](./README_file/cover_photo.png)
# International Rock Climbing Recommendation System

Diabetes is a disease that is becoming more common. People’s unhealthy habits, like diets full of sugar and unhealthy fats in 
addition to no exercise, is contributing to this increase. The CDC reports that 34.2 million people or 10% of the US population 
have it. There are 26.9 million people diagnosed and 7.3 million people or 21.4% of the 10% are undiagnosed. 
These are alarming numbers. 

## 1. Problem Statement:
Can this disease be detected early?

## 2.Data
> * This dataset has been collected from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Early+stage+diabetes+risk+prediction+dataset.), using direct questionnaires from the patients of 
Sylhet Diabetes Hospital in Sylhet, Bangladesh and approved by a doctor.
* The dataset consisted of 16 variables plus the response variable that indicated if a patient was positive or negative for 
the disease and there are 520 patients. 

## 3.Data Wrangling
All the variables were binary except for Age which was continuous. The data set was mostly clean with no missing values. 

## 4.Exploratory Data Analysis
* This is a classification problem
* The response variable was balanced
[](./read_me/prop_response.png)
* Test if threre is a difference between the fraction of men and women who tested positive
[](./read_me/fem_male_prop.png)
* Test if there is a relationship between age and getting the disease

## 5.Data processing and model selection
* Logistic Regression gave ROC_AUC score of 0.9789 and precision_recall AUC score of 0.9879
* KNeighbors classifier gave ROC_AUC score of 0.9789 and precision_recall AUC score of 0.9888
* Decision Tree classifier gave ROC_AUC score of 0.9262 and precision_recall AUC score of 0.9638
* Random Forest Classifier gave ROC_AUC score of 0.9262 and precision_recall AUC score of 0.9638

