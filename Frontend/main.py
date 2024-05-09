from flet import *
import route as r

def main(page: Page):
    
    r.Router(page)
    
app(target = main)