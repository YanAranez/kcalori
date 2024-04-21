from flet import *
import view_kcal as v
import route as r
import control_kcal as ctrl
import default as defa

def main(page: Page):
    
    r.Router(page)
    
app(target = main)