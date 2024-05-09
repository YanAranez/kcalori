import flet as ft

class Small_Page:

##  DEFAULT PAGE PROPERTIES

    def __init__(
                    self, 
                    title, 
                    vert_alignment = None, 
                    hori_alignment = None
                ):
        
        self.title          =   title
        self.v_alignment    =   vert_alignment
        self.h_alignment    =   hori_alignment    
        
    def apply(self, page):
        
        page.title                  =   self.title
        page.vertical_alignment     =   self.v_alignment
        page.horizontal_alignment   =   self.h_alignment
        page.window_width           =   650
        page.window_height          =   500
        page.bgcolor                =   "WHITE"
        page.window_resizable       =   False
        page.window_center()
        
        
class Main_Page:

##  DEFAULT PAGE PROPERTIES

    def __init__(
                    self, 
                    title, 
                    vert_alignment = None, 
                    hori_alignment = None
                ):
        
        self.title          =   title
        self.v_alignment    =   vert_alignment
        self.h_alignment    =   hori_alignment    
        
    def apply(self, page):
        
        page.title                  =   self.title
        page.vertical_alignment     =   self.v_alignment
        page.horizontal_alignment   =   self.h_alignment
        page.window_width           =   1000
        page.window_height          =   700
        page.bgcolor                =   "WHITE"
        page.window_resizable       =   False
        page.window_center()

class Btn:
    
##  DEFAULT BUTTON PROPERTIES

    def __init__(
                    self, 
                    text        =   None, 
                    icon        =   None, 
                    on_click    =   None, 
                    height      =   None, 
                    bgcolor     =   None, 
                    color       =   None,
                    disabled    =   None,
                    alignment   =   None
                ):
        
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
            disabled    =   self.disabled,
            
        )

class TxtF:
    
##  DEFAULT TEXT FIELD PROPERTIES
    
    def __init__(
                    self, 
                    label, 
                    size       =   None,
                    input_f    =   None,
                    ch         =   None,
                    ls         =   None, 
                    width      =   None,
                    height     =   None, 
                    password   =   None, 
                    c_r_pw     =   None, 
                    ta         =   None, 
                    color      =   None, 
                    bdr_color  =   None, 
                    fclr       =   None, 
                    h_text     =   None, 
                    text_val   =   None,
                    hv         =   None
                ):
        
        self.label      =   label       
        self.size       =   size
        self.input_f    =   input_f     or  None
        self.ch         =   ch
        self.ls         =   ls          or  ft.TextStyle(color = '#0C2D57')
        self.width      =   width       or  200
        self.height     =   height  
        self.password   =   password    or  False
        self.c_r_pw     =   c_r_pw      or  False
        self.ta         =   ta          or  ft.TextAlign.LEFT
        self.color      =   color       or  '#0C2D57'
        self.bdr_color  =   bdr_color   or  '#0C2D57'
        self.hv         =   hv          or  '#99DBF5'
        self.fclr       =   fclr        or  'White'
        self.text_val   =   text_val    or  ft.VerticalAlignment.CENTER
        self.h_text     =   h_text  
    
    @property
    
    def c_dtxtf(self):
        
        return ft.TextField(
            
            label               =   self.label,
            text_style          =   ft.TextStyle(size = self.size),
            input_filter        =   self.input_f,
            cursor_height       =   self.ch,
            label_style         =   self.ls,
            width               =   self.width,
            height              =   self.height,
            password            =   self.password,
            can_reveal_password =   self.c_r_pw,
            text_align          =   self.ta,
            hover_color         =   self.hv,
            fill_color          =   self.fclr,
            color               =   self.color,
            border_color        =   self.bdr_color,
            hint_text           =   self.h_text,
            hint_style          =   ft.TextStyle(color  =  self.color),
            text_vertical_align =   self.text_val
        )

class AlertDia:
    
##  DEFAULT ALERT DIALOG (ERROR) PROPERTIES
    
    def __init__(
                    self, 
                    title           =   None, 
                    weight          =   None, 
                    color           =   None, 
                    text_align      =   None, 
                    content         =   None, 
                    text_align_2    =   None, 
                    bgcolor         =   None,
                    on_dismiss      =   None
                ):
        
        self.title          =   title
        self.weight         =   weight          or  ft.FontWeight.BOLD
        self.color          =   color           or  "White"
        self.text_align     =   text_align      or  "Center"
        self.content        =   content        
        self.text_align_2   =   text_align_2    or  "Center"
        self.bgcolor        =   bgcolor         or  "#0C2D57"   
        self.on_dismiss     =   on_dismiss
    
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
            
            bgcolor     =   self.bgcolor,
            on_dismiss  =   self.on_dismiss
        )

class NavigDestination:
    
##  DEFAULT NAVIGATION DESTINATION (NAVIGATION BAR) PROPERTIES

    def __init__(
                    self, 
                    name, 
                    tooltip, 
                    label   = None, 
                    size    = None
                ):
        
        self.label      =   label   or  " "
        self.name       =   name
        self.size       =   size    or  35
        self.tooltip    =   tooltip
        
    @property
    
    def c_dNavi(self):
        
        return ft.NavigationDestination(

            label                   =   self.label,
            
            icon_content            =   ft.Icon(
                
                                        name    =   self.name, 
                                        size    =   self.size,
                                        tooltip =   self.tooltip,
                                        color   =   ft.colors.WHITE
                                    )
        )
        
class Cont:
    
    def __init__(
                    self, 
                    *contents, 
                    width, 
                    height, 
                    padding     =   None,
                    theme_mode  =   None,
                    m_top       =   None,
                    m_bottom    =   None, 
                    m_left      =   None, 
                    m_right     =   None
                ):
                
        self.contents           =   contents
        self.width              =   width
        self.height             =   height
        self.m_top              =   m_top           or  0
        self.m_bottom           =   m_bottom        or  0
        self.m_left             =   m_left          or  0
        self.m_right            =   m_right         or  0  
        self.theme_mode         =   theme_mode    
        self.padding            =   padding         or  ft.padding.all(20)
    
    @property
    
    def c_dCont(self):
        
        stack = ft.Stack(
            
            [content for content in self.contents],
            width   =   self.width,
            height  =   self.height
        )
        
        return ft.Container(
            
            
            stack,
            width           =   self.width,
            height          =   self.height,
            border_radius   =   10,
            shadow          =   ft.BoxShadow(
                        
                                    spread_radius   =   1,
                                    blur_radius     =   5,
                                    color           =   "#0C2D57",
                                    offset          =   ft.Offset(0, 0),
                                    blur_style      =   ft.ShadowBlurStyle.OUTER
                            ),
            padding         =   self.padding,        
            margin          =   ft.Margin(
                                    top       =   self.m_top, 
                                    bottom    =   self.m_bottom, 
                                    left      =   self.m_left, 
                                    right     =   self.m_right
                            )
        )
        
        
        