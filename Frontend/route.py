from flet import Page
import view_kcal as v
import control_kcal as ctl


class Router:
    
    def __init__(self, page):
        
        self.page   =   page
        
        
        self.register_login_page    =   v.Registerlogin_Page(page)
        self.register_page_1        =   v.Register_Page_1(page)
        self.register_page_2        =   v.Register_Page_2(page)
        self.login_page             =   v.Login_Page(page)
        self.main_page              =   v.Main_Page(page)
        
        self.home(Page)

    def home(self, _):
        
        self.page.clean()
        self.register_login_content, _  =   self.register_login_page.build()
        self.page.add(self.register_login_content)

        self.register_login_page.signup_btn.on_click    =   self.on_register_clicked
        self.register_login_page.login_btn.on_click     =   self.on_login_clicked

    
    def on_register_clicked(self, _):
        
        self.page.clean()
        signup_content, _   =   self.register_page_1.build()
        self.page.add(signup_content)

        self.register_page_1.return_button.on_click     =   self.home
        self.register_page_1.next_button.on_click       =   self.on_next_clicked
        
        self.register_page_2.return_button.on_click     =   self.on_register_clicked
        self.register_page_2.next_button.on_click       =   self.main_page_handler


    def on_login_clicked(self, _):
        
        self.page.clean()
        login_content, _    =   self.login_page.build()
        self.page.add(login_content)

        self.login_page.return_button.on_click  =   self.home
        self.login_page.login_button.on_click   =   self.on_login_submit


    def on_login_submit(self, _):
        
        # Logic for handling login submission
        pass


    def on_return_clicked(self, _):
        
        self.page.clean()
        self.__init__(Page)


    def on_next_clicked(self, _):
        
        self.page.clean()
        signup_content, _   =   self.register_page_2.build()
        self.page.add(signup_content)


    def main_page_handler(self, _):
        # Logic for main page handler
        pass


    def main_pg(self):
        
        self.page.clean()
        main_content, _     = self.main_page.build()
        self.page.add(main_content)


def main(page: Page):
    
    router = Router(page)
    
    