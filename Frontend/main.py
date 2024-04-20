from flet import Page, app
from route import route

def main(page: Page):
    
    route(page)

app(target = main)