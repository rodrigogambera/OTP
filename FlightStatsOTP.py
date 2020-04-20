#!/usr/bin/python3
# FlightStatsOTP.py
# Collect OTP data from FlightStats.
# by Rodrigo Elias - rodrigo.elias@mieux.com.br
# 2020-03-03 19:38

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

yesterday = datetime.datetime.strftime(datetime.datetime.now() - datetime.timedelta(1), '%Y-%m-%d')
cnx = pyodbc.connect(
    server = config['Database']['Server'],
    database = config['Database']['Database'],
    user = config['Database']['User'],
    password = config['Database']['Password'],
    port = config['Database']['Port'],
    driver = config['Database']['Driver']
)
cursor = cnx.cursor()
cursor.execute("SELECT [dbo].[Companies].[iata_code] AS \'CompanyCode\', [dbo].[PlannedFlights].[flight_number] AS \'FlightNumber\', CONVERT(date, [dbo].[PlannedFlights].[departure_time]) AS \'FlightDate\' FROM [dbo].[PlannedFlights], [dbo].[Companies] WHERE [dbo].[PlannedFlights].[company_code] = [dbo].[Companies].[icao_code] AND CONVERT(date, [dbo].[PlannedFlights].[departure_time]) = \'' + ? +'\' AND [dbo].[Companies].[iata_code] != \'\' AND [dbo].[PlannedFlights].[active] = 1 GROUP BY [dbo].[Companies].[iata_code], [dbo].[PlannedFlights].[flight_number], CONVERT(date, [dbo].[PlannedFlights].[departure_time]) ORDER BY [dbo].[Companies].[iata_code], [dbo].[PlannedFlights].[flight_number] ASC", yesterday)

print(datetime.datetime.now())
for row in cursor.fetchall():
    flight_company = row[0]
    flight_number = row[1]
    flight_date = row[2]

    http = urllib3.PoolManager(
        cert_reqs='CERT_REQUIRED',
        ca_certs=certifi.where()
    )

    url = config['OTP']['URL'] + str(flight_company) + '/' + str(flight_number) + '/' + str(flight_date)[0:4] + '/' + str(flight_date)[5:7] + '/' + str(flight_date)[8:10]
    filename = str(flight_date) + '-' + str(flight_company) + str(flight_number) + '-' + config['OTP']['Filename']
    chunk_size = 1024

    r = http.request('GET', url, preload_content=False)

    with open(config['OTP']['Folder'] + '/' + filename, 'wb') as out:
        while True:
            data = r.read(chunk_size)
            if not data:
                break
            out.write(data)

print(datetime.datetime.now())
