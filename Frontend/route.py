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
        
        self.validator      =   ctl.ValidateUserExists(self.register_page_1.username_text_field.value)
        
        self.register_page_2.return_button.on_click     =   self.on_to_register_page_1
        self.register_page_2.next_button.on_click       =   self.register_conditions
    
    
    def on_to_login_page(self, _):
        
        self.page.clean()
        self.login_content, _    =   self.login_page.build()
        self.page.add(self.login_content)

        self.login_page.return_button.on_click  =   self.home
        self.login_page.login_button.on_click   =   self.login_conditions
        
    
    def register_conditions(self, _):
        
        if self.validator.exists == True: 
            self.register_page_2.error_dialog_1()
        
        elif self.validator.exists == False: 
            self.register()
            
        
    def login_conditions(self, _):
        
        user_exists_validator        =   ctl.ValidateUserExists(self.login_page.username_text_field.value)
        password_correct_validator   =   ctl.ValidateLoginPassword(self.login_page.username_text_field.value, 
                                                                self.login_page.password_text_field.value)
        
        if not user_exists_validator.exists:
            self.login_page.error_dialog_2()
        elif user_exists_validator.exists and not password_correct_validator.correct:
            self.login_page.error_dialog_3()
        elif user_exists_validator.exists and password_correct_validator.correct:
            self.login_page.success_dialog()
            
    
    
    def register(self):
        
        m.create_User(self.register_page_1.first_name.value,
                        self.register_page_1.last_name.value,
                        self.register_page_1.username_text_field.value,
                        self.register_page_1.password_text_field.value,
                        self.register_page_2.gender_slider.selected_index,
                        self.register_page_2.age_txtf.value,
                        self.register_page_2.height_txtf.value,
                        self.register_page_2.weight_txtf.value,
                        self.register_page_2.activity_level.value,
                        self.register_page_2.goal.value
                        )
        
        self.register_page_2.success_dialog()
        
        
class Router_Main:
    
    def __init__(self, page):
        
        self.page       =   page
        
        self.main_page  =   v.Main_Page(page)
        
        
        self.home(Page)
    

    def home(self, _):
        
        self.page.clean()
        self.main_page_contents, self.add_meal, self.navibar, _  =  self.main_page.build_home()
        self.page.add(self.main_page_contents, self.add_meal, self.navibar)
        
        
    
        
    
        
        
    