import csv

# sqlfile = open("Customer_Call_Center_DDL.sql", "a")
# filehandler = open("CustomerCallCenterDDl.sql", "w")
print("\nDROP DATABASE IF EXISTS call_center"
      "\nCREATE DATABASE  call_center")
dataDictionary = open("fruitlist.csv", "r")
finalDataDict = csv.reader(dataDictionary, delimiter=',')
tableNameCheck = ""
tableList = []

for row in finalDataDict:
    list1 = row
    tableName = list1[0]
    fieldName = list1[1]
    sqlType = list1[1]
    isNull = list1[2]
    isPrimaryKey = list1[3]
    autoIncrement = list1[4]
    comment = list1[4]
    if tableNameCheck != tableName:
        tableList.append(tableName)
        print("}")
        print()
        print("CREATE TABLE ", tableName, " {")
    print("\t", fieldName, ", ", sqlType, ", ", isNull, ", ", isPrimaryKey, ", ", autoIncrement, ", ", comment)
    tableNameCheck = tableName

dataDictionary.close()

# TODO: Get Insert statements working
#
# exampleData = open("fruitlist.csv", "r")
# data = csv.reader(exampleData, delimiter=",")
# dataList = list(data)
# index = 0
# # dataFormat = "(" + data + ")"
# for table in tableList:
#     print("INSERT INTO ", table, "VALUES")
#     if index == len(list(data)):
#         for data1 in dataList:
#             dataFormat = "(" + data1[index] + ")"
#             print(dataFormat).strip('\n')
#             index += 1
#
