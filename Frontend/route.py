from flet import Page
import view_kcal as v
import control_kcal as ctl
import model_kcal as m


class Router:
    
    def __init__(self, page):
        
        self.page   =   page
        
        self.register_login_page    =   v.Registerlogin_Page(page)
        self.register_page_1        =   v.Register_Page_1(page)
        self.register_page_2        =   v.Register_Page_2(page)
        self.login_page             =   v.Login_Page(page)
        self.user_authent_manage    =   m.UserAuthentManagement()
        
        
        self.home(Page)


    def home(self, _):
        
        self.page.clean()
        self.register_login_content, _  =   self.register_login_page.build()
        self.page.add(self.register_login_content)

        self.register_login_page.signup_btn.on_click    =   self.on_to_register_page_1
        self.register_login_page.login_btn.on_click     =   self.on_to_login_page

    
    def on_to_register_page_1(self, _):

        self.page.clean()
        self.signup_content, _   =   self.register_page_1.build()
        self.page.add(self.signup_content)

        self.register_page_1.return_button.on_click     =   self.home
        self.register_page_1.next_button.on_click       =   self.on_to_register_page_2
    
    
    def on_to_register_page_2(self, _):
        
        self.page.clean()
        self.signup_content, _   =   self.register_page_2.build()
        self.page.add(self.signup_content)
        
        self.register_page_2.return_button.on_click     =   self.on_to_register_page_1
        self.register_page_2.next_button.on_click       =   self.try_register
    
    
    def on_to_login_page(self, _):
        
        self.page.clean()
        self.login_content, _    =   self.login_page.build()
        self.page.add(self.login_content)

        self.login_page.return_button.on_click  =   self.home
        self.login_page.login_button.on_click   =   self.try_login
        
    
    def try_register(self, _):
        
        selected_index  =   self.register_page_2.gender_slider.selected_index
        selected_index  =   ctl.convertGender(selected_index)
        
        act_level       =   self.register_page_2.activity_level.value
        act_level       =   ctl.convertActivityLabel(act_level)
        
        goal            =   self.register_page_2.goal.value
        goal            =   ctl.convertGoals(goal)
        
        
        error_message   =   self.user_authent_manage.create_user(
                                        self.register_page_1.first_name.value,
                                        self.register_page_1.last_name.value,
                                        self.register_page_1.username_text_field.value,
                                        self.register_page_1.password_text_field.value,
                                        self.register_page_2.age_txtf.value,
                                        selected_index,
                                        self.register_page_2.height_txtf.value,
                                        self.register_page_2.weight_txtf.value,
                                        act_level,
                                        goal
                        )
        
        if ctl.ErrorInRegister(error_message) == -1:
            self.register_page_2.error_dialog_1()
            
        elif ctl.ErrorInRegister(error_message) == 0:
            self.register_page_2.success_dialog()
            
        
    def try_login(self, _):
        
        login           =   m.UserAuthentManagement()
        
        error_message   =   login.login_user(
                                    self.login_page.username_text_field.value, 
                                    self.login_page.password_text_field.value
                        )
        
        if ctl.ErrorInLogin(error_message) == -1:
            self.login_page.error_dialog_2()
            
        elif ctl.ErrorInLogin(error_message) == 0:
            self.login_page.success_dialog()
        
class Router_Main:
    
    def __init__(self, page):
        
        self.page       =   page
        
        self.main_page  =   v.Main_Page(page)
        
        
        self.home(Page)
    

    def home(self, _):
        
        self.page.clean()
        self.main_page_contents, self.navibar, _  =  self.main_page.build_home()
        self.page.add(self.main_page_contents, self.navibar)
        
        
    
        
    
        
        
    