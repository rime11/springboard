![cover_photo](./Documentation/readme/Sales-Forecasting.jpg)

# Sales Forecasting
## The data:
The data set contains sales transactions occurring between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.
##Data Wrangling:
The data consisted of 1,067,371 rows and 8 columns with 5,835 customers and 4,615 products.  
Columns are:  
● InvoiceNumber: unique number for each customer   transaction  
● Stockcode:uniquenumberforeachproduct   
● Description:productdescription  
● Quantity Sold  
● Price per item  
● InvoiceDate   
● CustomerID   
● Country  
There were many missing description and customer ID, plus negative quantities and price.The data needed to be cleaned to get it ready for analysis. 
##Data Analysis
###Customer Cohorts 
Customer Cohorts were created which helps in understanding customer churn and how customer behaviour affects the business. Also it gives insight into customer lifetime value so that more effective customer engagement can be created. 
###RFM analysis:
Recency, Frequency and monetary value of customers was calculated which gives customers a quantitative value that is measurable and easy to understatnd. Kmeans and hierarchical clustering was used to cluster customers according to their purchase history and past activities.
##Visualization and Forecasting
Visualizations of sales were performed to gain deeper understanding of the business
##ARIMA
Autoregression Integrated Moving Average model was used for daily sailes prediction
###Other Machine Learning Models
Many more features were created, like mean, median of daily, weekly and quarterly sales. The models used are 
* Linear Regression  
* DecisionTree  
* RandomForest  
* XGBoost   
were run on the data. Accurancy was greatly improved with the new features created.

