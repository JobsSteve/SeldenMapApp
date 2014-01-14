import sqlite3;
from datetime import datetime, date;
import time

inConn = sqlite3.connect('portMap.sqlite3')
outConn = sqlite3.connect('Model.sqlite')

inCursor = inConn.cursor()
outCursor = outConn.cursor()

outConn.execute("DELETE FROM ZPORTS")

maxId = 0
inCursor.execute("select * from ports")
for row in inCursor:
    
    if row[0] > maxId:
        maxId = row[0]
    
    # Create ZFAILEDBANKINFO entry
    vals = []
    vals.append(row[0]) # Z_PK
    vals.append(2) # Z_ENT
    vals.append(1) # Z_OPT
#need to give ports a value for its information description
    vals.append(row[2]) # ZXLOCATION
    vals.append(row[3]) # ZYLOCATION
    vals.append(row[1]) # ZNAME
    outConn.execute("insert into ZPORTS values(?, ?, ?, ?, ?,?)", vals)
    

outConn.execute("update Z_PRIMARYKEY set Z_MAX=?", [maxId])
 

outConn.execute("DELETE FROM ZPORTINFORMATION")
maxId = 0
inCursor.execute("select * from portInformation")
for row in inCursor:
    
    if row[0] > maxId:
        maxId = row[0]
    
    # Create ZFAILEDBANKINFO entry
    vals = []
    vals.append(row[0]) # Z_PK
    vals.append(2) # Z_ENT
    vals.append(1) # Z_OPT
#need to give port info a value for its port description
#alternatively, give portinfo a name and look up the port from that?
    vals.append(row[1]) # ZINFO
    outConn.execute("insert into ZPORTINFORMATION values(?, ?, ?, ?)", vals)


outConn.execute("update Z_PRIMARYKEY set Z_MAX=?", [maxId])


outConn.execute("DELETE FROM ZPROVINCES")
maxId = 0
inCursor.execute("select * from provinces")
for row in inCursor:
    
    if row[0] > maxId:
        maxId = row[0]
    
    # Create ZFAILEDBANKINFO entry
    vals = []
    vals.append(row[0]) # Z_PK
    vals.append(2) # Z_ENT
    vals.append(1) # Z_OPT
    vals.append(row[2]) # ZXLOCATION
    vals.append(row[3]) # ZYLOCATION
    vals.append(row[1]) # ZNAME
    outConn.execute("insert into ZPROVINCES values(?, ?, ?, ?, ?,?)", vals)


outConn.execute("update Z_PRIMARYKEY set Z_MAX=?", [maxId])

outConn.commit()