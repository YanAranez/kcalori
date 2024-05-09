import pyodbc
import control_kcal as c

class UserAuthentManagement:
    
    def __init__(self, uid = None, password = None, server = None, database = None, *deets):
        
        self.server     =   server      or  r'' ##input server
        self.database   =   database    or  'CaloriePal' 
        self.uid        =   uid         or  'sa'
        self.password   =   password    or  '' ##input pw
        
        
        self.default_conn_string = (
            
            f'DRIVER={{ODBC Driver 17 for SQL Server}};'
            f'SERVER={self.server};'
            f'DATABASE={self.database};'
            f'UID={self.uid};'
            f'PWD={self.password}'
        )

    def create_user(self, f_name, l_name, username, password, age, gender, height, weight, activity_level, goal_Wmodified):
        
        cursor = None 

        try:
            conn = pyodbc.connect(self.default_conn_string)
            cursor = conn.cursor()

            sql = """
            EXEC [dbo].[sp_CreateCaloriUser] 
                @fn = ?, 
                @ln = ?, 
                @un = ?, 
                @pw = ?, 
                @age = ?, 
                @gen = ?, 
                @hei = ?, 
                @wei = ?, 
                @act = ?, 
                @goal_Wmodified = ?
            """

            params = (
                f_name,
                l_name,
                username,
                password,
                age,
                gender,
                height,
                weight,
                activity_level,
                goal_Wmodified
            )

            cursor.execute(sql, params)
            conn.commit()
            
            cursor.close()
            conn.close()
            
            self.login_user(username, password)

        except pyodbc.Error as ex:
            
            if cursor:
                cursor.rollback()
            
            if cursor is not None:  
                cursor.close()
                
            if conn is not None: 
                conn.close()
                
            message = ex.args[0]
            return message
            

    def login_user(self, username, password):
        
        try:
            
            conn_string = (
            
                f'DRIVER={{ODBC Driver 17 for SQL Server}};'
                f'SERVER={self.server};'
                f'DATABASE={self.database};'
                f'UID={username};'
                f'PWD={password}'
            )
            
            conn = pyodbc.connect(conn_string)
            cursor = conn.cursor()
            UserLoggedIn(conn, cursor, username)

        except pyodbc.Error as ex:
            
            conn = pyodbc.connect(self.default_conn_string)
                
            message = ex.args[0]
            return message

class UserLoggedIn:
    
    def __init__(self, conn = None, cursor = None, username = None):
        
        self.conn       =   conn
        self.cursor     =   cursor
        self.username   =   username
        
    def return_Username(self) -> str:
        
        username = self.username
        return username
    
