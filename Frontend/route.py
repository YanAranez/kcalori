from flet import Page, app
from view_kcal import Registerlogin_Page, Login_Page, Signup_Page, Main_Page, Sub_Pages

def main(page: Page):
    
    register_login_page     =   Registerlogin_Page(page)
    login_page              =   Login_Page(page)
    signup_page             =   Signup_Page(page)
    main_page               =   Main_Page(page)
    sub_pages               =   Sub_Pages(page)

    register_login_content, register_login_props = register_login_page.build()
    page.add(register_login_content)

    #Register/Login Page
    def on_register_clicked(_):
        
        page.clean()
        signup_content, signup_props    =   signup_page.build_wind1()
        page.add(signup_content)
        
        def on_return_clicked(_):
            
            page.clean()
            main(page)
    
        signup_page.return_button.on_click   =   on_return_clicked


    def on_login_clicked(_):
        
        page.clean()
        login_content, login_props      =   login_page.build()
        page.add(login_content)
        
        def on_return_clicked(_):
            
            page.clean()
            main(page)
    
        login_page.return_button.on_click   =   on_return_clicked


    register_login_page.signup_btn.on_click     =   on_register_clicked
    register_login_page.login_btn.on_click      =   on_login_clicked

app(target = main)