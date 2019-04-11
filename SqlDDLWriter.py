import csv

# filehandler = open("CustomerCallCenterDDl.sql", "w")

dataDictionary = open("fruitlist.csv", "r")
finalDataDict = csv.reader(dataDictionary, delimiter=',')
for row in finalDataDict:
    list1 = row
    tableName = list1[0]
    sqlType = list1[1]
    isNull = list1[2]
    isPrimaryKey = list1[3]
    autoIncrement = list1[4]
    comment = list1[4]
    print(tableName, ", ", sqlType, ", ", isNull, ", ", isPrimaryKey, ", ", autoIncrement, ", ", comment)
# sqlfile = open("Customer_Call_Center_DDL.sql", "a")

print("\nDROP DATABASE IF EXISTS call_center"
      "\nCREATE DATABASE  call_center")

# for row in finalDataDict:
