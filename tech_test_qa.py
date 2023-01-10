import numpy as np
import pandas as pd
import datetime
df = pd.read_csv("result.csv")
for i in df['id']:
    if type(i) == int & i>0 :
       pass
    else:
        print("Enter a valid number")
#value of id should be whole number
for j in df['dt_report']:
    year,month,date = j.split('-')
     
    isValidDate = True
    try :
        datetime.datetime(int(year),int(month), int(day))
    except ValueError :
        isValidDate = False
         
    if(isValidDate) :
        pass
    else :
        print ("enter a valid date")
for k in df['currency']:
    if type(k) == int & k>0 :
       pass
    else:
        print("Enter a valid amount")
# Currency should be a whole number
 ##
