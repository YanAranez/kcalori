import re
import route as r
import pyodbc



class ValidateButtonState:

##  VALIDATES BUTTON STATES IN REGISTER AND/OR LOGIN PAGE

    def __init__(self, page, button, *fields):
        
        self.page       =   page
        self.button     =   button
        self.fields     =   fields
        
        for field in self.fields:
            field.on_change = self.validate
    
    
    def validate(self, *args):
        
        valid = True
        
        for field in self.fields:
            
            field.border_color = '#0C2D57'
            self.page.update()
            
            if not field.value:
                valid = False
                field.border_color = '#FF0000'
                self.page.update()
                
                break
                

            if "password" in field.label.lower():

                if not self.check_password_complexity(field.value):
                    valid = False
                    field.border_color = '#FF0000'
                    self.page.update()

                
            if field.label.lower() == "age":
                
                try:
                    age = int(field.value)
                    
                    if not (18 <= age <= 60):
                        valid = False
                        field.border_color = '#FF0000'
                        self.page.update()
                    
                except ValueError:
                    valid = False
                    field.border_color = '#FF0000'
                    self.page.update()

            
            if field.label.lower() == "height":
                
                try:
                    height = int(field.value)
                    
                    if not (height > 0):
                        valid = False
                        field.border_color = '#FF0000'
                        self.page.update()
                
                except ValueError:
                    valid = False
                    field.border_color = '#FF0000'
                    self.page.update()

                
            if field.label.lower() == "weight":
                
                try:
                    weight = int(field.value)
                    
                    if not (weight > 0):
                        valid = False
                        field.border_color = '#FF0000'
                        self.page.update()
                
                except ValueError:
                    valid = False
                    field.border_color = '#FF0000'
                    self.page.update()

            
            if field.label.lower() == "first name" or field.label.lower() == "last name":
                
                if not (re.search(r"[A-Z]", field.value) or re.search(r"[a-z]", field.value)):
                    valid = False
                    field.border_color = '#FF0000'
                    self.page.update()

        self.button.disabled = not valid
        self.page.update()
    
    def check_password_complexity(self, password):
        # Password complexity criteria:
        # - At least 8 characters long
        # - At least 3 out of the 4 conditions are met:
        #   - At least 1 uppercase letter
        #   - At least 1 lowercase letter
        #   - At least one number
        #   - At least one symbol
        
        if len(password) < 8:
            return False

        conditions_met = 0
        
        if re.search(r"[A-Z]", password): 
            conditions_met += 1
            
        if re.search(r"[a-z]", password):  
            conditions_met += 1
            
        if re.search(r"\d", password):    
            conditions_met += 1
            
        if re.search(r"[^\w\s]", password): 
            conditions_met += 1
        
        return conditions_met >= 3

def convertGender(selected_index):
    
    if selected_index == 0:
        return 'M'
    if selected_index == 1:
        return 'F'
    
def convertActivityLabel(val):
    
    if val == 'Sedentary':
        return '1'
    elif val == 'Lightly Active':
        return '2'
    elif val == 'Moderately Active':
        return '3'
    elif val == 'Active':
        return '4'
    
def convertGoals(val):
    
    if val == 'Maintain':
        return 'Maintain'
    elif val == 'Mild Weight Loss':
        return 'Mild Weight Loss'
    elif val == 'Weight Loss':
        return 'Weight Loss'
    
def ErrorInRegister(message) -> int:
    
    error_code = 0  

    if message == "42000":
        error_code = -1
        
    return error_code

def ErrorInLogin(message) -> int:
    
    error_code = 0  

    if message == "28000":
        error_code = -1
        
    return error_code
    