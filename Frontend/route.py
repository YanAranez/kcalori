from flet import Page
import view_kcal as v
import control_kcal as ctl


def on_register_clicked(page: Page, register_page_1, register_page_2, main_func):
    
    
    def handler(_):
        
        page.clean()
        signup_content, signup_props            =   register_page_1.build()
        page.add(signup_content)
        
  
        def on_return_clicked(_):
            
            page.clean()
            main_func(page)
        
        register_page_1.return_button.on_click  =   on_return_clicked
        
        
        def on_next_clicked(_):
            
            page.clean()
            signup_content, signup_props        =   register_page_2.build()
            page.add(signup_content)

        register_page_1.next_button.on_click    =   on_next_clicked
        register_page_2.return_button.on_click  =   handler
        register_page_2.next_button.on_click    =   main_page_handler
    
    return handler


def on_login_clicked(page: Page, login_page, main_page, main_func):
    
    
    def handler(_):
        
        page.clean()
        login_content, login_props          =   login_page.build()
        page.add(login_content)
        
        
        def on_return_clicked(_):
            page.clean()
            main_func(page)
    
        login_page.return_button.on_click   =   on_return_clicked
        
        
        def on_login_clicked(_):
            
            page.clean()
            main_page_content, main_page_props  =   main_page.build()
            page.add(main_page_content)
            

        login_page.login_button.on_click        =   on_login_clicked

    
    return handler


def main_page_handler(page: Page):
    
    pass