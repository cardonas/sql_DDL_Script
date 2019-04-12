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
print(tableNameList)
