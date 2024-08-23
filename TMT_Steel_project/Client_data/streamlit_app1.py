#!/usr/bin/env python
# coding: utf-8

# ## Deployment

# In[ ]:


import streamlit as st
import pandas as pd
from statsmodels.tsa.arima.model import ARIMA

# Load data
df = pd.read_csv(r"C:\Users\MsK_PC\360digiTMG\Data_Science\DS_TMT_Steel_Project\Client_data\12mm.csv")
df = df.drop(['t', 't_square', 'log_Quantity', 'April', 'August', 'December', 'February', 'January', 'July', 'June', 'March', 'May', 'November', 'October', 'September'], axis=1)

# Data Partition
Train = df.iloc[:len(df)-365]
Test = df.iloc[len(df)-365:]

# Train ARIMA model
model = ARIMA(Train.Quantity, order=(22, 1, 6))
res = model.fit()

# Streamlit app
st.markdown("<h1 style='text-align: center;'>INNODATATICS</h1>", unsafe_allow_html=True)
st.subheader("Forecasting Quantity App")
# st.write("Summary of ARIMA Model:")
# st.text(res.summary())

# Generate forecasted values for 2024 (including leap year day)
forecast_steps = 366  # 366 days in 2024
forecast_index = pd.date_range(start="2024-01-01", end="2024-12-31")
forecast = res.get_forecast(steps=forecast_steps, alpha=0.1)  # 90% confidence interval

# Create a DataFrame for forecasts and confidence intervals
forecast_df = pd.DataFrame({
    "Date": forecast_index,
    "Forecasted_Quantity": forecast.predicted_mean,
    "Lower_CI": forecast.conf_int()['lower Quantity'],
    "Upper_CI": forecast.conf_int()['upper Quantity']
})
forecast_df["Date"] = forecast_df["Date"].dt.strftime("%Y-%m-%d") 
forecast_df.set_index("Date", inplace=True) 

# Display forecasted values with confidence intervals in a table
st.write("Forecasted Values for 2024 with 90% Confidence Intervals:")
st.dataframe(forecast_df)


# In[ ]:




