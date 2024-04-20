import flet as ft
import view_kcal as v
import route as r
import control_kcal as ctrl
import default as defa

def main(page: ft.Page):
    
    register_login_page     =   v.Registerlogin_Page(page)
    register_page_1         =   v.Register_Page_1(page)
    register_page_2         =   v.Register_Page_2(page)
    login_page              =   v.Login_Page(page)
    main_page               =   v.Main_Page(page)
    
    register_login_content, _   =   register_login_page.build()
    page.add(register_login_content)

    register_login_page.signup_btn.on_click     =   r.on_register_clicked(
        
                                                    page, 
                                                    register_page_1, 
                                                    register_page_2, 
                                                    main
                                                )
    register_login_page.login_btn.on_click      =   r.on_login_clicked(
                                                    
                                                    page, 
                                                    login_page, 
                                                    main_page, 
                                                    main
                                                )
    
    
ft.app(target = main)