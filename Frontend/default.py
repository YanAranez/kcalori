import flet as ft

class Page:
    
    def __init__(self, title, vert_alignment = None):
        
        self.title      =   title
        self.alignment  =   vert_alignment
        
    def apply(self, page):
        
        page.title              =   self.title
        page.vertical_alignment =   self.alignment
        page.window_width       =   1000
        page.window_height      =   600
        page.bgcolor            =   "WHITE"
        page.window_resizable   =   False

class Btn:

    def __init__(self, text, icon = None, on_click = None, height = None, bgcolor = None, color = None, disabled = None):
        
        self.text       =   text
        self.icon       =   icon
        self.on_click   =   on_click
        self.height     =   height      or  30
        self.bgcolor    =   bgcolor     or  "#DD5746"
        self.color      =   color       or  "#FEFAF6"
        self.disabled   =   disabled    or  False
    
    @property
    
    def c_debtn(self):
        
        return ft.ElevatedButton(
            text        =   self.text,
            icon        =   self.icon,
            height      =   self.height,
            bgcolor     =   self.bgcolor,
            color       =   self.color,
            on_click    =   self.on_click,
            disabled    =   self.disabled
        )

class TxtF:
    
    def __init__(self, label, width = None, password = None, c_r_pw = None, ta = None, color = None, fclr = None, h_text = None):
        
        self.label      =   label
        self.width      =   width       or  200
        self.password   =   password    or  False
        self.c_r_pw     =   c_r_pw      or  False
        self.ta         =   ta          or  ft.TextAlign.LEFT
        self.color      =   color       or  '#0C2D57'
        self.fclr       =   fclr        or  'White'
        self.h_text     =   h_text
    
    @property
    
    def c_dtxtf(self):
        
        return ft.TextField(
            label               =   self.label,
            width               =   self.width,
            password            =   self.password,
            can_reveal_password =   self.c_r_pw,
            text_align          =   self.ta,
            hover_color         =   self.color,
            fill_color          =   self.fclr,
            color               =   self.color,
            border_color        =   self.color,
            hint_text           =   self.h_text,
            hint_style          =   ft.TextStyle(color  =  self.color)
        )
            
class page_Actions:
    
    def __init__(self, page):

        self.page = page
    
    def reset(self):
        
        self.page.clean()