import flet as ft
import view_kcal as v
import default as defa

class ValidateButtonState:
    
    def __init__(self, page, button, *fields):
        
        self.page       =   page
        self.button     =   button
        self.fields     =   fields
        
        for field in self.fields:
            field.on_change = self.validate
    
    def validate(self, *args):
        
        if all(field.value for field in self.fields):
                self.button.disabled = False
                
        else:
                self.button.disabled = True
        
        self.page.update()
        
        
        
         

    
    