#!/usr/bin/python3
# ANACSirosData.py
# Collect data from ANAC related to future flights.
# by Rodrigo Elias - rodrigo.elias@mieux.com.br
# 2020-02-28 10:36

# from dateutil.rrule import rrule, DAILY
import configparser
import urllib3
import certifi
import os
import datetime
import csv
import time
import pyodbc
import re

config = configparser.ConfigParser()
config.sections()
config.read('ANACSirosData.cfg')

cnx = pyodbc.connect(
    server = config['Database']['Server'],
    database = config['Database']['Database'],
    user = config['Database']['User'],
    password = config['Database']['Password'],
    port = config['Database']['Port'],
    driver = config['Database']['Driver']
)
cursor = cnx.cursor()
cursor.execute("SELECT TOP 1 [dbo].[PlannedFlightsSource].[id] AS 'ID', [dbo].[PlannedFlightsSource].[source] AS 'Source', [dbo].[PlannedFlightsSource].[filename] AS 'Filename', [dbo].[PlannedFlightsSource].[etag] AS 'ETag', [dbo].[PlannedFlightsSource].[last_modified] AS 'LastModified', [dbo].[PlannedFlightsSource].[content_length] AS 'ContentLength', [dbo].[PlannedFlightsSource].[insert_date] AS 'InsertDate' FROM [dbo].[PlannedFlightsSource] WHERE [dbo].[PlannedFlightsSource].[active] = 1 ORDER BY [dbo].[PlannedFlightsSource].[insert_date] DESC")
db_last_modified = ''
db_etag = ''
db_content_length = ''

for row in cursor.fetchall():
    db_last_modified = row[4]
    db_etag = row[3]
    db_content_length = row[5]

http = urllib3.PoolManager(
    cert_reqs='CERT_REQUIRED',
    ca_certs=certifi.where()
)
url = config['Base']['URL']
filename = config['Base']['Filename']
chunk_size = 1024

r = http.request('GET', url, preload_content=False)

attr_last_modified = r.getheader('Last-Modified')
attr_etag = re.sub('\"','', r.getheader('ETag'))
attr_content_length = r.getheader('Content-Length')

if(attr_last_modified == db_last_modified and attr_etag == db_etag and int(attr_content_length) == int(db_content_length)):
    print('File already downloaded. Skipping...')
else:
    print('New file! Downloading now...')
    with open(filename, 'wb') as out:
        while True:
            data = r.read(chunk_size)
            if not data:
                break
            out.write(data)
    
    cursor.execute("INSERT INTO [dbo].[PlannedFlightsSource] ([dbo].[PlannedFlightsSource].[source], [dbo].[PlannedFlightsSource].[filename], [dbo].[PlannedFlightsSource].[etag], [dbo].[PlannedFlightsSource].[last_modified], [dbo].[PlannedFlightsSource].[content_length]) VALUES (?, ?, ?, ?, ?)", str(config['Base']['Source']), str(config['Base']['Filename']), str(attr_etag), str(attr_last_modified), str(attr_content_length))
    cnx.commit()
    
    if(int(attr_content_length) == int(os.path.getsize(config['Base']['Filename']))):
        print('File sucessfully downloaded.')

        print(datetime.datetime.now())
        with open(filename, newline='') as csvfile:
            reader = csv.reader(csvfile, delimiter=';')
            for row in reader:
                if(len(row[0]) == 3):
                    if(row[4] == "1"):
                        day0 = True
                    else:
                        day0 = False
                    
                    if(row[5] == "2"):
                        day1 = True
                    else:
                        day1 = False
                    
                    if(row[6] == "3"):
                        day2 = True
                    else:
                        day2 = False

                    if(row[7] == "4"):
                        day3 = True
                    else:
                        day3 = False

                    if(row[8] == "5"):
                        day4 = True
                    else:
                        day4 = False

                    if(row[9] == "6"):
                        day5 = True
                    else:
                        day5 = False

                    if(row[10] == "7"):
                        day6 = True
                    else:
                        day6 = False
                    
                    d1 = datetime.date(int(row[15][0:4]), int(row[15][5:7]), int(row[15][8:10]))
                    d2 = datetime.date(int(row[16][0:4]), int(row[16][5:7]), int(row[16][8:10]))
                    diff = d2 - d1
                    for i in range(diff.days + 1):
                        weekday = (datetime.date(int(str(d1 + datetime.timedelta(i))[0:4]),int(str(d1 + datetime.timedelta(i))[5:7]),int(str(d1 + datetime.timedelta(i))[8:10])).weekday())
                        if((weekday == 0 and day0 == True) or (weekday == 1 and day1 == True) or (weekday == 2 and day2 == True) or (weekday == 3 and day3 == True) or (weekday == 4 and day4 == True) or (weekday == 5 and day5 == True) or (weekday == 6 and day6 == True)):
                            if(int(str(row[24])[0:2]) - int(str(row[23])[0:2]) < 0):
                                data_inicio = (d1 + datetime.timedelta(i))
                                data_fim = (d1 + (datetime.timedelta(i) + datetime.timedelta(1)))
                            else:
                                data_inicio = (d1 + datetime.timedelta(i))
                                data_fim = (d1 + datetime.timedelta(i))

                            data_inicio = str(data_inicio) + ' ' + row[23] + ':00'
                            data_fim = str(data_fim) + ' ' + row[24] + ':00'
                            flight_number = str(re.sub('[A-Z]', '', row[2]))
                            
                            cursor.execute("INSERT INTO [dbo].[PlannedFlights] ([dbo].[PlannedFlights].[etag], [dbo].[PlannedFlights].[company_code], [dbo].[PlannedFlights].[flight_number], [dbo].[PlannedFlights].[equipment], [dbo].[PlannedFlights].[seat_number], [dbo].[PlannedFlights].[siros_id], [dbo].[PlannedFlights].[siros_status], [dbo].[PlannedFlights].[date_request], [dbo].[PlannedFlights].[operation_type], [dbo].[PlannedFlights].[flight_stage], [dbo].[PlannedFlights].[departure_time],[dbo].[PlannedFlights].[arrival_time], [dbo].[PlannedFlights].[departure_airport], [dbo].[PlannedFlights].[arrival_airport], [dbo].[PlannedFlights].[servicetype], [dbo].[PlannedFlights].[transport_type], [dbo].[PlannedFlights].[codeshare]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", attr_etag, row[0], flight_number, row[3], row[11], row[12], row[13], row[14], row[17], row[18], data_inicio, data_fim, row[19], row[21], row[25], row[26], row[27])

            print(datetime.datetime.now())
            cnx.commit()
            print(datetime.datetime.now())
    else:
        print('Corrupted download. Removing file.')

r.release_conn()
