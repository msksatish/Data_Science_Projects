#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import streamlit as st
import pandas as pd
import joblib
import pickle

# Load the machine learning models and preprocessing objects
model1 = pickle.load(open('residue.pkl', 'rb'))
impute = joblib.load('meanimpute')
winsor = joblib.load('winsor')
minmax = joblib.load('minmax')
encoding = joblib.load('encoding')

st.title('Cement Residue Prediction')

# Upload a CSV file with input data
uploaded_file = st.file_uploader("Upload a CSV file", type=["csv"])

if uploaded_file is not None:
    data = pd.read_csv(uploaded_file)

    # Exclude the "Residue" column for predictions
    if 'Residue' in data.columns:
        data.drop(columns=['Residue'], inplace=True)

    # Apply preprocessing steps
    data_cleaned = impute.transform(data)
    data_cleaned = winsor.transform(data_cleaned)
    data_cleaned = minmax.transform(data_cleaned)
    data_encoded = encoding.transform(data_cleaned)

    # Make predictions using the model
    predictions = model1.predict(data_encoded)

    # Create a DataFrame with the predictions
    result = pd.DataFrame({'Residue': predictions})

    # Add the predictions back to the original data
    data['Residue'] = result['Residue']

    # Display the data frame with predicted values
    st.write(data)

    # Option to download the data with predicted values as a CSV file
    if st.button('Download Data with Predictions'):
        data.to_csv('data_with_predictions.csv', index=False)

