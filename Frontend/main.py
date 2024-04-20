import flet as ft
import view_kcal as v  

def main(page: ft.page):
    
    #for testing only (no routes yet)
    #starting page
    root                        =   v.Registerlogin_Page(page)
    page_content, page_props    =   root.build()
    page.add(page_content)
    
    #login page
    #root                        =   v.Login_Page(page)
    #page_content, page_props    =   root.build()
    #page.add(page_content)
    
    #signup pages
    #root                        =   v.Signup_Page(page)
    #page_content, page_props    =   root.build_wind1()
    #page.add(page_content)
    
    #root                        =   v.Signup_Page(page)
    #page_content, page_props    =   root.build_wind2()
    #page.add(page_content)
    
ft.app(target=main)
