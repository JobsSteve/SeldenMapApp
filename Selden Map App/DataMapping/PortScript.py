import sqlite3;

conn = sqlite3.connect('portMap.sqlite3')
c = conn.cursor()
c.execute('drop table if exists ports')
c.execute('drop table if exists portInformation')
c.execute('drop table if exists provinces')
c.execute('create table ports(id integer primary key autoincrement,name text, xLocation float, yLocation float)')
c.execute('create table portInformation(id integer primary key autoincrement, information text)')
c.execute('create table provinces(id integer primary key autoincrement,name text, xLocation float, yLocation float)')

# Read lines from file, skipping first line
data = open("PortMapping.csv", "r").readlines()
for entry in data:
    # Parse values
    vals = entry.split(",")
    
    # Insert the row!
    print "Inserting %s..." % (vals[0])
    sql = "insert into ports values(NULL, ?, ?, ?)"
    c.execute(sql, vals)

data = open("portInformation.csv", "r").readlines()
for entry in data:
    # Parse values
    vals = entry.split(",")
    
    # Insert the row!
    print "Inserting %s..." % (vals[0])
    sql = "insert into portInformation values(NULL, ?)"
    c.execute(sql, vals)

data = open("ProvinceMapping.csv", "r").readlines()
for entry in data:
    # Parse values
    vals = entry.split(",")
    
    # Insert the row!
    print "Inserting %s..." % (vals[0])
    sql = "insert into provinces values(NULL, ?, ?, ?)"
    c.execute(sql, vals)
# Done!
conn.commit()