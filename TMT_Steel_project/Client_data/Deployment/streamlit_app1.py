#!/usr/bin/env python
# coding: utf-8

# ## Deployment

# In[ ]:


import streamlit as st
import pandas as pd
from statsmodels.tsa.arima.model import ARIMA

# Load data
df = pd.read_csv(r"F:\Backup_Data_17-1-24\user_data\360digiTMG\Data_Science\DS_TMT_Steel_Project\Client_data\12mm.csv")
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

# Date range selection with date input widgets
start_date = st.date_input("Select Start Date:", min_value=pd.to_datetime("2024-01-01").date(), max_value=pd.to_datetime("2024-12-31").date(), value=pd.to_datetime("2024-01-01").date())
end_date = st.date_input("Select End Date:", min_value=pd.to_datetime("2024-01-01").date(), max_value=pd.to_datetime("2024-12-31").date(), value=pd.to_datetime("2024-12-31").date())

# Check if a valid date range is selected
if start_date <= end_date:
    # Generate forecasted values for the selected date range
    forecast_steps = (end_date - start_date).days + 1  # Number of days in the selected date range
    forecast_index = pd.date_range(start=start_date, periods=forecast_steps)
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
    st.write(f"Forecasted Values for the Selected Date Range:")
    st.dataframe(forecast_df)

    # Add a download button for the forecasted results
    if st.button('Download Forecasted Results'):
        # Create a link to download the forecasted results as a CSV file
        csv = forecast_df.to_csv(index=False)
        st.download_button(
            label="Download CSV",
            data=csv,
            file_name="forecasted_results.csv",
            key="download-csv",
        )
else:
    st.warning("Please select a valid date range where the Start Date is before or equal to the End Date.")

