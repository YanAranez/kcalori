from flet import Page
from view_kcal import Signup_Page, Login_Page


def on_register_clicked(page: Page, signup_page: Signup_Page, main_func):
    
    
    def handler(_):
        
        page.clean()
        signup_content, signup_props        =   signup_page.build_wind1()
        page.add(signup_content)
        
                
        def on_return_clicked(_):
            
            page.clean()
            main_func(page)
        
        signup_page.return_button.on_click  =   on_return_clicked
        
        
        def on_next_clicked(_):
            
            page.clean()
            signup_content, signup_props    =   signup_page.build_wind2()
            page.add(signup_content)
        
        signup_page.next_button.on_click    =   on_next_clicked
    
    return handler


def on_login_clicked(page: Page, login_page, main_func):
    
    
    def handler(_):
        
        page.clean()
        login_content, login_props          =   login_page.build()
        page.add(login_content)
        
        
        def on_return_clicked(_):
            page.clean()
            main_func(page)
    
        login_page.return_button.on_click   =   on_return_clicked
    
    return handler


def main_page_handler(page: Page):
    
    pass