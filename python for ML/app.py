from flask import Flask, render_template, request
from sklearn.tree import DecisionTreeClassifier
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
import pickle
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler

app = Flask(__name__, template_folder='templates')

# Assuming df is your DataFrame
le_sex = LabelEncoder()
le_education_level = LabelEncoder()
le_marital_status = LabelEncoder()
le_occupation = LabelEncoder()
le_relationship = LabelEncoder()
le_workclass = LabelEncoder()

df = pd.read_csv('census.csv')

# Label encode categorical variables
df['sex'] = le_sex.fit_transform(df['sex'])
df['education_level'] = le_education_level.fit_transform(df['education_level'])
df['marital_status'] = le_marital_status.fit_transform(df['marital_status'])
df['occupation'] = le_occupation.fit_transform(df['occupation'])
df['relationship'] = le_relationship.fit_transform(df['relationship'])
df['workclass'] = le_workclass.fit_transform(df['workclass'])

# Drop unnecessary columns
columns_to_drop = ['race', 'native-country', 'hours_per_week', 'education-num']
df.drop(columns_to_drop, axis=1, inplace=True)

# Initialize a scaler, then apply it to the features
scaler = MinMaxScaler()  # default=(0, 1)

# Scale numerical data
numerical = ['age', 'capital_gain', 'capital_loss']
df[numerical] = scaler.fit_transform(df[numerical])

# drop income
y = df['income']
df.drop('income', axis=1, inplace=True)

# Encode the 'income' data to numerical values
encoder = LabelEncoder()
y = encoder.fit_transform(y)  # Use fit_transform directly

# Changing categorical data to numbers since a model will use numbers to make predictions
# Features after one-hot encoding
X = pd.get_dummies(df)

# Split the data into train and test sets
X_train, X_test, Y_train, Y_test = train_test_split(X, y, test_size=0.3, random_state=0)

# Fit the model
dt = DecisionTreeClassifier()
dt.fit(X_train, Y_train)

# Save the model to a file
pickle.dump(dt, open("df.pkl", "wb"))

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/predict", methods=["GET", "POST"])
def predict():
    sex = request.form['sex']
    age = float(request.form['age'])
    education_level = request.form['education_level']
    marital_status = request.form['marital_status']
    occupation = request.form['occupation']
    relationship = request.form['relationship']
    workclass = request.form['workclass']
    capital_gain = float(request.form['capital_gain'])
    capital_loss = float(request.form['capital_loss'])

    # Transform categorical variables using the LabelEncoders
    sex_encoded = transform_with_check(le_sex, sex)
    education_level_encoded = transform_with_check(le_education_level, education_level)
    marital_status_encoded = transform_with_check(le_marital_status, marital_status)
    occupation_encoded = transform_with_check(le_occupation, occupation)
    relationship_encoded = transform_with_check(le_relationship, relationship)
    workclass_encoded = transform_with_check(le_workclass, workclass)

    # Create the input array for prediction
    form_array = np.array([[sex_encoded, age, education_level_encoded, marital_status_encoded,
                            occupation_encoded, relationship_encoded, workclass_encoded,
                            capital_gain, capital_loss]])

    # Load the model and make predictions
    dt = pickle.load(open("df.pkl", "rb"))
    prediction = dt.predict(form_array)[0]

    result = "Income is >50K" if prediction == 1 else "Income is <=50K"

    return render_template("result.html", result=result)

def transform_with_check(label_encoder, value):
    try:
        encoded_value = label_encoder.transform([value])[0]
    except ValueError as e:
        # Handle previously unseen labels
        encoded_value = -1  # You can choose a default value or handle it as needed
    return encoded_value

if __name__ == "__main__":
    app.run(debug=True)
