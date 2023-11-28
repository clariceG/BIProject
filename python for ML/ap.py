from flask import Flask, render_template, request
from sklearn.tree import DecisionTreeClassifier
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
import pickle
from sklearn.preprocessing import MinMaxScaler, LabelEncoder

app = Flask(__name__, template_folder='templates')

@app.route("/")
def home():
    # Loading the Dataset
    df = pd.read_csv('census.csv')

    # To drop the columns that will not be used
    columns_to_drop = ['race', 'native-country', 'hours_per_week', 'education-num']
    df.drop(columns_to_drop, axis=1, inplace=True)

    # Initialize a scaler, then apply it to the features
    scaler = MinMaxScaler() # default=(0, 1)

    # Scale numerical data
    numerical=['age','capital_gain','capital_loss']
    df[numerical]=scaler.fit_transform(df[numerical])

    # drop income
    y = df['income']
    df.drop('income', axis=1, inplace=True)

    # Encode the 'income' data to numerical values
    encoder = LabelEncoder()
    y = y.apply(lambda x: 0 if x == '<=50K' else 1) # To convert it to 0 or 1          

    # Changing categorical data to numbers since a model will use numbers to make predictions
    # Features after one-hot encoding
    X = pd.get_dummies(df)

    # Split the data into training and testing sets
    X_train, X_test, Y_train, Y_test = train_test_split(X, y, test_size=0.3, random_state=0)

    # Initialize and fit the model
    dt = DecisionTreeClassifier()
    dt.fit(X_train, Y_train)

    # Save the trained model to a file
    pickle.dump(dt, open("df.pkl", "wb"))

    return render_template("home.html")

@app.route("/predict", methods=["POST"])
def predict():
    # Extracting form data
    sex = request.form['sex']
    age = request.form['age'] 
    education_level = request.form['education_level']
    marital_status = request.form['marital_status']
    occupation = request.form['occupation']
    relationship = request.form['relationship']
    workclass = request.form['workclass']
    capital_gain = request.form['capital_gain']
    capital_loss = request.form['capital_loss']

    # Creating an array for prediction
    form_array = np.array([[sex, age, education_level, marital_status, occupation, relationship, workclass, capital_gain, capital_loss]])

    # Loading the trained model
    dt = pickle.load(open("df.pkl", "rb"))

    # Making prediction
    prediction = dt.predict(form_array)[0]

    if prediction == 1:
        result = "Income is >50K"
    else:
        result = "Income is <=50K"

    return render_template("result.html", result=result)

if __name__ == "__main__":
  app.run(debug=True)
