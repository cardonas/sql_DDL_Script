import csv

print("DROP DATABASE IF EXISTS call_center;\n"
      "CREATE DATABASE  call_center;\n\n"
      "use call_center;\n")
# use database

# open csv file to read mode
dataDictionary = open("tablelist.csv", "r")
# use csv reader to initial parse tablelist.csv
finalDataDict = csv.reader(dataDictionary, delimiter=',')
tableNameCheck = ""
tableNameList = []
for col in finalDataDict:
    if col[0] != '':
        tableNameList.append(col[0])
dataDictionary.close()

dataDictionary = open("tablelist.csv", "r")
finalDataDict = csv.reader(dataDictionary, delimiter=',')
for row in finalDataDict:
    field1 = row[1]
    field2 = row[2]
    field3 = row[3]
    field4 = row[4]
    field5 = row[5]

    print(field1, field5, field3, field4, field5)


