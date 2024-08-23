import streamlit as st
import pandas as pd
import pickle
from statsmodels.regression.linear_model import OLSResults
model = OLSResults.load("fitted_model.pickle")


# Define a function to make predictions
def predict_salesvolumeinTonnes(date):
    # Create a dataframe with the input values
    data = pd.DataFrame({'Sales_volume': [0]})
    # Make a prediction using the loaded model
    try:
        prediction = model.forecast(steps=1)[0]
        return prediction
    except Exception as e:
        st.error('Error: {}'.format(str(e)))


# Create a Streamlit app
st.title('Steel rod')
# Create input fields for the user to enter data
date = st.date_input('Enter the date:')
# Make a prediction when the user clicks the 'Predict' button
if st.button('Predict'):
    prediction = predict_salesvolumeinTonnes(date)
    if prediction is not None:
        st.write('The predicted sales volume is: {:.6f}'.format(prediction))

+