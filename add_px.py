import mysql.connector

# Define source and destination database connection parameters
source_host = 'localhost'
source_user = 'root'
source_password = 'Sigurds.2.Potatoes'
source_database = 'mco1_stadvdb'

destination_host = 'ccscloud.dlsu.edu.ph'
destination_port = 20006
destination_user = 'username'
destination_password = 'password'
destination_database = 'all'

# Connect to source and destination MySQL databases
try:
    source_connection = mysql.connector.connect(
        host=source_host,
        user=source_user,
        password=source_password,
        database=source_database
    )
    source_cursor = source_connection.cursor()

    destination_connection = mysql.connector.connect(
        host=destination_host,
        port=destination_port,  
        user=destination_user,
        password=destination_password,
        database=destination_database
    )
    destination_cursor = destination_connection.cursor()

    # Define SQL query to fetch data from source database
    sql_query = '''
        select pxid, age, gender from px
    '''
    # For Luzon
    # WHERE RegionName IN ('Ilocos Region (I)', 'Cagayan Valley (II)', 'Central Luzon (III)', 'CALABARZON (IV-A)', 'MIMAROPA (IV-B)', 'Bicol Region (V)', 'National Capital Region (NCR)', 'Cordillera Administrative Region (CAR)');
    # For VisMin
    #WHERE RegionName IN ('Western Visayas (VI)', 'Central Visayas (VII)', 'Eastern Visayas (VIII)','Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)', 'Zamboanga Peninsula (IX)','Northern Mindanao (X)', 'Davao Region (XI)', 'SOCCSKSARGEN (Cotabato Region) (XII)','Caraga (XIII)');
    # Execute the SQL query
    source_cursor.execute(sql_query)

    # Fetch all rows from the source database
    rows = source_cursor.fetchall()

    # Insert rows into the destination database
    for row in rows:
        # Define SQL query to insert data into the destination database
        insert_query = '''
        INSERT INTO px(pxid, age, gender)
        VALUES(%s,%s,%s) 
        '''
        #INSERT INTO appointments(pxid, clinicid, doctorid, apptid, app_type, is_Virtual, status, TimeQueued, QueueDate, StartTime, EndTime, RegionName, Province)
        #VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        # Execute the insert query
        destination_cursor.execute(insert_query, row)

    # Commit the transaction
    destination_connection.commit()

    # Close cursors and connections
    source_cursor.close()
    source_connection.close()
    destination_cursor.close()
    destination_connection.close()

    print("Data transfer completed successfully.")
 
except mysql.connector.Error as error:
    print("Error:", error)
