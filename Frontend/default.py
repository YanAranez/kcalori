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
    
    def __init__(self, label, ls = None, width = None, password = None, c_r_pw = None, ta = None, color = None, bdr_color = None, fclr = None, h_text = None, hv = None):
        
        self.label      =   label
        self.ls         =   ls          or  ft.TextStyle(color = '#0C2D57')
        self.width      =   width       or  200
        self.password   =   password    or  False
        self.c_r_pw     =   c_r_pw      or  False
        self.ta         =   ta          or  ft.TextAlign.LEFT
        self.color      =   color       or  '#0C2D57'
        self.bdr_color  =   bdr_color   or  '#0C2D57'
        self.hv         =   hv          or  '#99DBF5'
        self.fclr       =   fclr        or  'White'
        self.h_text     =   h_text
    
    @property
    
    def c_dtxtf(self):
        
        return ft.TextField(
            
            label               =   self.label,
            label_style         =   self.ls,
            width               =   self.width,
            password            =   self.password,
            can_reveal_password =   self.c_r_pw,
            text_align          =   self.ta,
            hover_color         =   self.hv,
            fill_color          =   self.fclr,
            color               =   self.color,
            border_color        =   self.bdr_color,
            hint_text           =   self.h_text,
            hint_style          =   ft.TextStyle(color  =  self.color)
        )

class AlertDia:
    
    def __init__(self, title = None, weight = None, color = None, text_align = None, content = None, text_align_2 = None, bgcolor = None):
        
        self.title          =   title
        self.weight         =   weight          or  ft.FontWeight.BOLD
        self.color          =   color           or  "White"
        self.text_align     =   text_align      or  ft.MainAxisAlignment.CENTER
        self.content        =   content        
        self.text_align_2   =   text_align_2    or  "Center"
        self.bgcolor        =   bgcolor         or  "#0C2D57"   
    
    @property
    
    def c_dalertdia(self):
        
        return ft.AlertDialog(
            
            title       =   ft.Text(
                    
                            self.title,
                            weight      =   self.weight,
                            color       =   self.color,
                            text_align  =   self.text_align
                        ),
            
            content     =   ft.Text(
                
                            self.content,
                            color       =   self.color,
                            text_align  =   self.text_align_2
                        ),
            
            bgcolor     =   self.bgcolor
        )