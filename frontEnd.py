# -*- coding: utf-8 -*-
"""
Created on Wed Dec 20 18:54:56 2023

@author: ruiji
"""
import streamlit as st
import pickle 
import numpy as np

import pandas as pd
from sqlalchemy import create_engine
import pymysql
pymysql.install_as_MySQLdb()
username = 'r****'
password = '*******'
host = '*****.mysql.database.azure.com'
port = 3306
dbname = 'onlineshoppingdb'
pymysql.install_as_MySQLdb()

conn_string = f'mysql+pymysql://{username}:{password}@{host}:{port}/{dbname}'
engine = create_engine(conn_string, connect_args={'charset': 'utf8'})


load_model = pickle.load(open('D:/NYU Courses/CSCIGA 2433 Database Systems/Project/model.sav', 'rb'))

def fetch_data(order_id):
    query = f"""
    SELECT o.Order_value, o.Discount, o.Number_of_items, s.Weight, c.Purchase_frequency, 
           s.Warehouse, s.Mode_of_shipment, c.Membership
    FROM `ORDER` as o 
    LEFT JOIN SHIPMENT as s ON s.Order_id = o.Order_id 
    LEFT JOIN CUSTOMER as c ON c.Customer_id = o.Customer_id
    WHERE o.Order_id = {order_id};
    """
    df = pd.read_sql(query, con=engine)
    
    # Handle cases where the order_id is not found
    if df.empty:
        return None
    
    # One-hot encoding for the categorical variables
    categorical_variables = ['Warehouse', 'Mode_of_shipment', 'Membership']
    df = pd.get_dummies(df, columns=categorical_variables)
    
    # Ensure all expected columns are present, fill missing with 0s
    expected_columns = [...]  # Fill in with the columns expected by your model
    for col in expected_columns:
        if col not in df.columns:
            df[col] = 0
    
    return df



def arrival_prediction(df):
    if df is None:
        return "Order ID not found."

    input_data = df.to_numpy()
    prediction = load_model.predict(input_data)
    
    return 'Great. The shipment will arrive on time.' if prediction[0] == 1 else 'Sorry. The shipment will delay.'



def main():
    st.title('Online Shopping Arrival Prediction')
    order_number = st.text_input('Enter Order number')
    
    if st.button('Predict Arrival Time'):
        if order_number:
            # Fetch data from the database
            order_data = fetch_data(order_number)
            
            # Make prediction
            result = arrival_prediction(order_data)
        else:
            result = 'Please enter a valid order number.'
    
        st.success(result)

if __name__ == '__main__':
    main()


    