import flet as ft
import view_kcal as v  

def main(page: ft.page):
    
    root                        =   v.Login_Page(page)
    page_content, page_props    =   root.build()
    page.add(page_content)
    
ft.app(target=main)
