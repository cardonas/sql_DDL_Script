import csv

# sqlfile = open("Customer_Call_Center_DDL.sql", "a")
# filehandler = open("CustomerCallCenterDDl.sql", "w")
print("DROP DATABASE IF EXISTS call_center;"
      "\nCREATE DATABASE  call_center;")

dataDictionary = open("tablelist.csv", "r")
finalDataDict = csv.reader(dataDictionary, delimiter=',')
tableNameCheck = ""
tableList = []
for row in finalDataDict:
    list1 = row
    tableName = list1[0]
    field1 = list1[1]
    field2 = list1[2]
    field3 = list1[3]
    field4 = list1[4]
    field5 = list1[5]

    if tableNameCheck != tableName:
        print("\t", field1, field2, field3, field4, field5)
        tableList.append(tableName)
        print("};")
        print()
        print("CREATE TABLE ", tableName, " {")

    print("\t", field1, field2, field3, field4, field5, ",")
    tableNameCheck = tableName

dataDictionary.close()

# TODO: Get Insert statements working
#
# exampleData = open("fruitlist.csv", "r")
# dataExample = csv.reader(exampleData, delimiter=",")
# dataList = list(dataExample)
# index = 0
# dataFormat = "(" + data + ")"
# for table in tableList:
#     print("INSERT INTO ", table, "VALUES")
#     for data in dataList:
#         print(data[index])
# dataFormat = "(" + data[index] + ")"
# print(dataFormat).strip('\n')
# index += 1
#
