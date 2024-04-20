from flet import Page, app
from view_kcal import Registerlogin_Page, Signup_Page, Login_Page, Main_Page
import route as r

def main(page: Page):
    
    register_login_page     =   Registerlogin_Page(page)
    signup_page             =   Signup_Page(page)
    login_page              =   Login_Page(page)
    main_page               =   Main_Page(page)
    
    register_login_content, _ = register_login_page.build()
    page.add(register_login_content)

    register_login_page.signup_btn.on_click     =   r.on_register_clicked(page, signup_page, main)
    register_login_page.login_btn.on_click      =   r.on_login_clicked(page, login_page, main)

app(target=main)