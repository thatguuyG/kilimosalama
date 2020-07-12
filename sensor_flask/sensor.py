from time import sleep
from flask import request, jsonify
import serial
import time
import datetime
import ast
import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials

from flask import Flask
app = Flask(__name__)

cred = credentials.Certificate("C:/Users/Waweru/Documents/Project/kilimo-salama-firebase-adminsdk-2ztjs-b6df9aab1a.json")

default_app = firebase_admin.initialize_app(cred,
        {'projectId': 'kilimo-salama'
        })

ref = firestore.client()
arduino = serial.Serial('COM5', 9600, timeout=.1)
# arduino.flushInput()

doc_ref = ref.collection(u'sensors').document()

@app.route("/api", methods = ['GET'])
def home():
    sensor_reading = {}
    sensor_reading['Farmer_Uid'] = str(request.args['Farmer_Uid']) 
    sensor_reading['Farmer_Name'] = str(request.args['Farmer_Name']) 
    while True:
    
        try:
               
            data = arduino.readline()[:-2].decode("utf-8")
            if data!="":
                soilMoisture = ast.literal_eval(data)['Moisture']
                pH = ast.literal_eval(data)['Ph']
                # sensor_reading['SoilMoisture'] = soilMoisture
                # sensor_reading['Ph'] = pH
                print(soilMoisture)
                print(pH)
                doc_ref.set({
                    u'soil_moisture': soilMoisture,
                    u'pH': pH,
                    u'farmer_name': str(request.args['Farmer_Name']),
                    u'farmer_uid': str(request.args['Farmer_Uid']),
                    u'time': str(datetime.datetime.now())
                }) 

        except:
            print("Unable to make sensor reading")
            break

    return jsonify(sensor_reading)

if __name__ == "__main__":
	app.run()