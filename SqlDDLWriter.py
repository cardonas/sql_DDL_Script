import csv

# sqlfile = open("Customer_Call_Center_DDL.sql", "a")
# filehandler = open("CustomerCallCenterDDl.sql", "w")
# starts databacse constuction
print("DROP DATABASE IF EXISTS call_center;\n"
	  "CREATE DATABASE  call_center;\n\n"
	  "use call_center;\n")
# use database

# open csv file to read mode
dataDictionary = open("tablelist.csv", "r")
# use csv reader to initial parse tablelist.csv
finalDataDict = csv.reader(dataDictionary, delimiter=',')

# variable used to check for a change in table name
tableNameCheck = ""
# list of table names (will be used for insert loops.)
tableList = []
first = True
for row in finalDataDict:
	# turns row into a list object
	list1 = row
	'''name of table. is checked against tableName check in order to only print once in teh create table
	statement '''
	tableName = list1[0]
	lastLine = True

	# fields that are printed per row
	field1 = list1[1]
	field2 = list1[2]
	field3 = list1[3]
	field4 = list1[4]
	field5 = list1[5]

	'''Checks if table name is not equal to tableNameCheck'''

	if tableNameCheck != tableName:
		if first == False:
			print("\t", field1, field2, field3, field4, field5)
			# prints }; to end last create table statement
			print("};")
			# adds new line for neatness
			print()
		elif first != False:
			tableNameCheck = tableName
			print("CREATE TABLE ", tableName, " {")
			# Prints last field without a comma
			# print("\t", field1, field2, field3, field4, field5)
			# adds new table to tableList
			first = True;
			tableList.append(tableName)

		# uses new tableName to start next create table statement
		# print("CREATE TABLE ", tableName, " {")
		else:
			# prints field if tableName == tableNameCheck
			print("\t", field1, field2, field3, field4, field5, ",")

	# changes Value of tableNameCheck when table name changes
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
