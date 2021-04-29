{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ![cover_photo](./readme_file/cover_photo.png)\
# Early Detection of Diabetes\
\
Diabetes is a disease that is becoming more common. People\'92s unhealthy habits, like diets full of sugar and unhealthy fats in \
addition to no exercise, is contributing to this increase. The CDC reports that 34.2 million people or 10% of the US population \
have it. There are 26.9 million people diagnosed and 7.3 million people or 21.4% of the 10% are undiagnosed. \
These are alarming numbers. \
\
## 1. Problem Statement:\
Can this disease be detected early?\
\
## 2.Data\
> * This dataset has been collected from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Early+stage+diabetes+risk+prediction+dataset.), using direct questionnaires from the patients of \
Sylhet Diabetes Hospital in Sylhet, Bangladesh and approved by a doctor.\
* The dataset consisted of 16 variables plus the response variable that indicated if a patient was positive or negative for \
the disease and there are 520 patients. \
\
## 3.Data Wrangling\
All the variables were binary except for Age which was continuous. The data set was mostly clean with no missing values. \
\
## 4.Exploratory Data Analysis\
* This is a classification problem\
* The response variable was balanced\
[](./readme_file/prop_response.png)\
* Test if threre is a difference between the fraction of men and women who tested positive\
[](./readme_file/fem_male_prop.png)\
* Test if there is a relationship between age and getting the disease\
\
## 5.Data processing and model selection\
* Logistic Regression gave ROC_AUC score of 0.9789 and precision_recall AUC score of 0.9879\
* KNeighbors classifier gave ROC_AUC score of 0.9789 and precision_recall AUC score of 0.9888\
* Decision Tree classifier gave ROC_AUC score of 0.9262 and precision_recall AUC score of 0.9638\
* Random Forest Classifier gave ROC_AUC score of 0.9262 and precision_recall AUC score of 0.9638\
* create pipeline\
}