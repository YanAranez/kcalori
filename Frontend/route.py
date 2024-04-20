import flet as ft
import control_kcal as cntrl
import default as defa
import view_kcal as v

class Route:
    def __init__(self, root):
        self.root = root

    def navigate_to_register_login_page(self):
        register_login_page = v.Registerlogin_Page(self.root)
        page_content, page_props = register_login_page.build()
        self.root.add(page_content)
        page_props.apply(self.root)

    def navigate_to_login_page(self):
        login_page = v.Login_Page(self.root)
        page_content, page_props = login_page.build()
        self.root.add(page_content)
        page_props.apply(self.root)
