import flet as ft
import control_kcal as ctl
import default as defa
import route as r
import datetime


class Registerlogin_Page:
    
    def __init__(self, parent):
        
        self.parent             =   parent
        
        
        self.page_properties        =   defa.Small_Page(
            
                                        "Register/Login Page", 
                                        ft.MainAxisAlignment.CENTER
                                        
                                    )

        
        self.kcalori_text           =   ft.Text(
            
                                        value       =   "kcalori", 
                                        size        =   50, 
                                        weight      =   ft.FontWeight.BOLD, 
                                        color       =   "#0C2D57", 
                                        text_align  =   ft.TextAlign.CENTER
                                    )
            
        
        self.signup_btn             =   defa.Btn(
            
                                        "Register", 
                                        icon    =   "assignment_add"
                                    
                                    ).c_debtn
        
        
        self.login_btn              =   defa.Btn(
            
                                        "Log In", 
                                        icon    =   "assignment_ind_outlined"
                                    
                                    ).c_debtn
        
        
        self.buttons_column         =   ft.Column(
            
                                        controls    =   [self.signup_btn, self.login_btn], 
                                        spacing     =   3
                                        
                                    )
        
        
        self.all_elements_row       =   ft.Row(
            
                                        controls    =   [self.kcalori_text, self.buttons_column], 
                                        spacing     =   15, 
                                        alignment   =   ft.MainAxisAlignment.CENTER
                                    
                                    )
        
    def build(self):
        
        self.page_properties.apply(self.parent)

        return  self.all_elements_row, self.page_properties
      
        
class Login_Page:
    
    def __init__(self, parent):
        
        self.parent                 =   parent
        
        self.page_properties        =   defa.Small_Page(
            
                                        "Login Page", 
                                        ft.MainAxisAlignment.CENTER
                                        
                                    )
            
        self.login_text             =   ft.Text(
            
                                        value       =   "Login", 
                                        size        =   45, 
                                        weight      =   ft.FontWeight.BOLD, 
                                        color       =   "#0C2D57", 
                                        text_align  =   ft.TextAlign.CENTER
                                
                                    )
        
        
        self.username_text_field    =   defa.TxtF(
            
                                        label   =   'Username',
                                    
                                    ).c_dtxtf

        
        self.password_text_field    =   defa.TxtF(
            
                                        label       =   'Password',
                                        password    =   True,
                                        c_r_pw      =   True,
                                        h_text      =   "8: a, B, 1, !"
                                
                                    ).c_dtxtf
        
        
        self.login_button           =   defa.Btn(
            
                                        "Login",
                                        height      =   30,
                                        disabled    =   True
                                
                                    ).c_debtn
        
        
        self.return_button          =   defa.Btn(
            
                                        "Return"
                                    
                                    ).c_debtn
        
        
        self.sub_ret_button         =   ft.Row(
            
                                        controls    =   [self.return_button, self.login_button], 
                                        spacing     =   3
                                
                                    )
        
        
        self.elem_column            =   ft.Column(
            
                                        controls    =   [self.username_text_field, self.password_text_field, self.sub_ret_button], 
                                        spacing     =   11
                                    
                                    )
        
        
        self.all_row                =   ft.Row(
            
                                        controls    =   [self.login_text,self.elem_column], 
                                        alignment   =   ft.MainAxisAlignment.CENTER,
                                        spacing     =   26
                                        
                                    )
        
        self.validate               =   ctl.ValidateButtonState(
                                        
                                        self.parent,
                                        self.login_button,
                                        self.username_text_field,
                                        self.password_text_field
                                    )
        
        self.username_not_exists    =   defa.AlertDia(
                                        
                                        title       =   "Invalid Username!",
                                        content     =   "Register first if you do not have an account yet"
                                        
                                    ).c_dalertdia
        
        self.incorrect_pw           =   defa.AlertDia(
                                        
                                        title       =   "Incorrect Password??",
                                        content     =   "The account exists but your password is incorrect... hmm.."
                                                        
                                    ).c_dalertdia
        
        self.success_login          =   defa.AlertDia(
                                        
                                        title       =   "Welcome Back!",
                                        content     =   "Successfully logged in"
                                                        
                                    ).c_dalertdia
        
    def build(self):
        
        self.page_properties.apply(self.parent)
        
        return self.all_row, self.page_properties
    
    
    def update(self):
        
        self.parent.update()
    
    
    def error_dialog_2(self):

        self.parent.dialog              =   self.username_not_exists
        self.username_not_exists.open   =   True
        self.update()
    
    
    def error_dialog_3(self):

        self.parent.dialog              =   self.incorrect_pw
        self.incorrect_pw.open   =   True
        self.update()
        
    def success_dialog(self):

        self.parent.dialog        =   self.success_login
        self.success_login.open   =   True
        self.update()
        
        r.Router_Main(self.parent)
        
        
class Register_Page_1:
    
    def __init__(self, parent):
        
        self.parent             =   parent
        
        self.page_properties    =   defa.Small_Page(
            
                                    "Register Page",
                                    ft.MainAxisAlignment.CENTER
                                        
                                )
        
        self.signup_text         =   ft.Text(
            
                                    value       =   "Register", 
                                    size        =   45, 
                                    weight      =   ft.FontWeight.BOLD, 
                                    color       =   "#0C2D57", 
                                    text_align  =   ft.TextAlign.CENTER
                                    
                                )
        
        
        self.user_profile_text   =   ft.Text(
            
                                    value       =   "User Profile", 
                                    size        =   15, 
                                    color       =   "#0C2D57", 
                                    text_align  =   ft.TextAlign.CENTER
                                
                                )
        
        
        self.text_stack          =   ft.Stack(
            
                                    [self.signup_text,
                                        
                                        ft.Container(
                                            
                                            content     =   self.user_profile_text,
                                            width       =   189,
                                            height      =   80,
                                            alignment   =   ft.alignment.bottom_right
                                            
                                                    )
                                    ]
                                )   
        
        
        self.first_name          =  defa.TxtF(
            
                                    label   =   "First Name"
                                    
                                ).c_dtxtf
        
        
        self.last_name           =  defa.TxtF(
            
                                    label   =   "Last Name"
                                    
                                ).c_dtxtf
        
        
        self.username_text_field =  defa.TxtF(
            
                                    label   =   "Username"
                                    
                                ).c_dtxtf
        
        
        self.password_text_field =  defa.TxtF(
            
                                    label       =   "Password",
                                    password    =   True,
                                    c_r_pw      =   True,
                                    h_text      =   "8: a, B, 1, !"
                                        
                                ).c_dtxtf
        
        
        
        self.next_button         =  defa.Btn(
            
                                    "Next",
                                    disabled    =   True
                                
                                ).c_debtn
        
        self.return_button       =  defa.Btn(
            
                                    "Return"
                                
                                ).c_debtn
        
        
        self.sub_ret_button      =  ft.Row(
            
                                    controls    =   [self.return_button, self.next_button], 
                                    spacing     =   3
                                        
                                )
        
        
        self.elem_column         =  ft.Column(
            
                                    controls    =   [   
                                                        self.first_name,
                                                        self.last_name,
                                                        self.username_text_field,
                                                        self.password_text_field,
                                                        self.sub_ret_button
                                                    ], 
                                    spacing     =   11
                                    
                                )
        
        
        self.all_row             =   ft.Row(
            
                                    controls    =   [
                                                        self.text_stack, 
                                                        self.elem_column
                                                    ],
                                    alignment   =   ft.MainAxisAlignment.CENTER,
                                    spacing     =   26
                                    
                                )
        
        self.validate               =   ctl.ValidateButtonState(
                                        
                                        self.parent,
                                        self.next_button,
                                        self.first_name,
                                        self.last_name,
                                        self.username_text_field,
                                        self.password_text_field
                                    )
        
    def build(self):
        
        self.page_properties.apply(self.parent)

        return self.all_row, self.page_properties
    

class Register_Page_2:
    
    def __init__(self, parent):
        
        self.parent             =   parent
        
        self.page_properties    =   defa.Small_Page(
            
                                    "Register Page",
                                    ft.MainAxisAlignment.CENTER
                                        
                                )
        
        
        self.signup_text        =   ft.Text(
            
                                    value       =   "Register", 
                                    size        =   45, 
                                    weight      =   ft.FontWeight.BOLD, 
                                    color       =   "#0C2D57", 
                                    text_align  =   ft.TextAlign.CENTER
                                        
                                )
        
        
        self.user_profile_text  =   ft.Text(
            
                                    value       =   "Calculate BMR", 
                                    size        =   15, 
                                    color       =   "#0C2D57", 
                                    text_align  =   ft.TextAlign.CENTER
                                        
                                )
        
        
        self.text_stack         =   ft.Stack(
            
                                    [self.signup_text,
                                        
                                        ft.Container(
                                            
                                            content     =   self.user_profile_text,
                                            width       =   191,
                                            height      =   80,
                                            alignment   =   ft.alignment.bottom_right
                                            
                                                    )
                                    ]
                                )   
        
        
        self.gender_slider      =   ft.CupertinoSlidingSegmentedButton(
                                
                                    controls        =   [
                                        
                                                        ft.Text("Male",     color = "White"),
                                                        ft.Text("Female",   color = "White")
                                                    ],
                                    thumb_color     =   "#DD5746",
                                    width           =   200,
                                    selected_index  =   0,
                                    bgcolor         =   "#9BB0C1"
                                )
                        
        
        self.age_txtf           =   defa.TxtF(
            
                                    label   =   "Age",
                                    h_text  =   "18 - 60"
                                    
                                ).c_dtxtf
        
        
        self.height_txtf        =   defa.TxtF(
                                
                                    label   =   "Height",
                                    h_text  =   "in cm"
                                    
                                ).c_dtxtf
        
        
        self.weight_txtf        =   defa.TxtF(
                                
                                    label       =   "Weight",
                                    h_text      =   "in kg"

                                ).c_dtxtf

        
        self.activity_level     =   ft.Dropdown(
                                
                                    label           =   "Activity Label",
                                    width           =   200,
                                    options         =   [
                                                    
                                                        ft.dropdown.Option("Sedentary"),
                                                        ft.dropdown.Option("Lightly Active"),
                                                        ft.dropdown.Option("Moderately Active"),
                                                        ft.dropdown.Option("Active")
                                                    ],
                                    color           =   "#0C2D57",
                                    border_color    =   "#0C2D57",
                                    bgcolor         =   "White"       
                                )
            
        
        self.goal               =   ft.Dropdown(
                                
                                    label       =   "Goal",
                                    width       =   200,
                                    options     =   [
                                                
                                                    ft.dropdown.Option("Maintain"),
                                                    ft.dropdown.Option("Mild Weight Loss"),
                                                    ft.dropdown.Option("Weight Loss")
                                                ],
                                    color       =   "#0C2D57",
                                    border_color=   "#0C2D57",
                                    bgcolor     =   "White"       
                                )
        
        
        self.next_button        =   defa.Btn(
            
                                    "Register",
                                    disabled    =   True
                                    
                                ).c_debtn
        
        
        self.return_button      =   defa.Btn(
            
                                    "Return"
                                    
                                ).c_debtn
        
        
        self.sub_ret_button     =   ft.Row(
            
                                    controls    =   [self.return_button, self.next_button], 
                                    spacing     =   3
                                        
                                )
        
        
        self.elem_column        =   ft.Column(
            
                                    controls    =   [   
                                                    
                                                        self.gender_slider,
                                                        self.age_txtf,
                                                        self.height_txtf,
                                                        self.weight_txtf,
                                                        self.activity_level,
                                                        self.goal,
                                                        self.sub_ret_button
                                                    ], 
                                    spacing     =   11
                                    
                                )

        self.all_row            =   ft.Row(
            
                                    controls    =   [
                                                        self.text_stack, 
                                                        self.elem_column
                                                    ],
                                    alignment   =   ft.MainAxisAlignment.CENTER,
                                    spacing     =   26
                                    
                                )
        
        self.validate               =   ctl.ValidateButtonState(
                                        
                                        self.parent,
                                        self.next_button,
                                        self.age_txtf,
                                        self.height_txtf,
                                        self.weight_txtf,
                                        self.activity_level,
                                        self.goal
                                    )
        
        
        self.username_alr_exists    =   defa.AlertDia(
                                        
                                        title       =   "Oops...",
                                        content     =   "Username already exists :<"
                                        
                                    ).c_dalertdia
        
        self.success_register       =   defa.AlertDia(
                                        
                                        title       =   "Welcome to kcalori!",
                                        content     =   "Successfully registered"
                                                        
                                    ).c_dalertdia 
        
        
    def build(self):
        
        self.page_properties.apply(self.parent)

        return  self.all_row, self.page_properties  
    
    def update(self):
        
        self.parent.update()   
            
    def error_dialog_1(self):

        self.parent.dialog              =   self.username_alr_exists
        self.username_alr_exists.open   =   True
        self.update()
        
    def success_dialog(self):

        self.parent.dialog              =   self.success_register
        self.success_register.open      =   True
        self.update()
        
        r.Router_Main(self.parent)
        

class Main_Page:
    
    def __init__(self, parent):
        
        self.parent                 =   parent

        self.page_properties        =   defa.Main_Page(
            
                                            "kcalori", 
                                            None,
                                            "Center"
                                            
                                    )

        
        ##      MAIN PAGE NAV BAR ##
        
        self.navi                   =   ft.NavigationBar(
            
                                        destinations    = [
                                            
                                            defa.NavigDestination(
                                                
                                                name    =   ft.icons.PERSON_SHARP,
                                                tooltip =   "Customize Profile"
                                                
                                            ).c_dNavi,
                                            
                                            
                                            defa.NavigDestination(
                                                
                                                name    =   ft.icons.STAR_BORDER_PURPLE500_SHARP,
                                                tooltip =   "Rethink Goals"
                                                
                                            ).c_dNavi,
                                            
                                            
                                            defa.NavigDestination(
                                                
                                                name    =   ft.icons.HOME_SHARP,
                                                tooltip =   "Home"
                                                
                                            ).c_dNavi,
                                        
                                        
                                            defa.NavigDestination(
                                                
                                                name    =   ft.icons.FASTFOOD_SHARP,
                                                tooltip =   "Meals Log"
                                                
                                            ).c_dNavi,
                                            
                                            
                                            defa.NavigDestination(
                                                
                                                name    =   ft.icons.LOGOUT_SHARP,
                                                tooltip =   "Log Out"
                                                
                                                
                                            ).c_dNavi,
                                        ],
                                        
                                        selected_index  =   2,
                                        elevation       =   1,
                                        bgcolor         =   "#0C2D57",
                                        indicator_color =   "#DD5746",
                                        label_behavior  =   ft.NavigationBarLabelBehavior.ONLY_SHOW_SELECTED,
                                        height          =   30,
                                        on_change       =   self.handle_change_tab
                                    )
        
        
        ##      CUSTOMIZE PROFILE 
        
        self.profile_text           =   ft.Text(
            
                                        value       =   "Profile", 
                                        size        =   25, 
                                        color       =   "#0C2D57", 
                                        weight      =   ft.FontWeight.BOLD,
                                        text_align  =   ft.TextAlign.CENTER
                                    
                                    )
        
        
        self.cus_txt                =   ft.Text(
            
                                        value       =   "customize",
                                        weight      =   ft.FontWeight.BOLD, 
                                        color       =   "#0C2D57", 
                                        text_align  =   ft.TextAlign.CENTER,
                                        size        =   25
                                        
                                    )
        
        
        self.text_stack_custprof    =   ft.Stack(
            
                                        [self.cus_txt,
                                            
                                            ft.Container(
                                                
                                                        content     =   self.profile_text,
                                                        width       =   130,
                                                        height      =   33,
                                                        alignment   =   ft.alignment.bottom_right,
                                                        margin      =   ft.Margin(
                                                                        
                                                                        top     =   25,
                                                                        left    =   0,
                                                                        bottom  =   0,
                                                                        right   =   0
                                                                    )
                                            )
                                        ]
                                    )
        
        
        self.first_name             =  defa.TxtF(
            
                                        label   =   "First Name"
                                        
                                    ).c_dtxtf
        
        
        self.last_name              =  defa.TxtF(
            
                                        label   =   "Last Name"
                                        
                                    ).c_dtxtf
        
        
        self.username_text_field    =  defa.TxtF(
            
                                        label   =   "Username"
                                        
                                    ).c_dtxtf
        
        
        self.password_text_field    =  defa.TxtF(
            
                                        label       =   "Password",
                                        password    =   True,
                                        c_r_pw      =   True,
                                        h_text      =   "8: a, B, 1, !"
                                            
                                    ).c_dtxtf
        
        
        self.save_button            =  defa.Btn(
            
                                        "Save"
                                    
                                    ).c_debtn
        
        
        self.cancel_button          =  defa.Btn(
            
                                        "Cancel"
                                    
                                    ).c_debtn
            
            
        self.sub_cancel_buttons     =  ft.Row(
                
                                        controls    =   [self.save_button, self.cancel_button], 
                                        spacing     =   3,
                                        alignment   =   ft.MainAxisAlignment.CENTER
                                            
                                    )


        self.elem_column_1          =  ft.Column(
            
                                        controls    =   [   
                                                            self.first_name,
                                                            self.last_name,
                                                            self.username_text_field,
                                                            self.password_text_field,
                                                            self.sub_cancel_buttons
                                                        ], 
                                        spacing     =   11
                                        
                                    )
        
        
        self.all_row_custprof       =   ft.Container(
                                    
                                        content     =   ft.Row(
                
                                                        controls    =   [
                                                                            self.text_stack_custprof,
                                                                            self.elem_column_1
                                                                        ],
                                                        
                                                        alignment   =   ft.MainAxisAlignment.CENTER,
                                                        spacing     =   26,
                                                        width       =   420,
                                                        height      =   300
                                                    ),
                                        
                                        margin      =   ft.Margin(
                                                        
                                                        top     =   20, 
                                                        left    =   -20, 
                                                        bottom  =   0, 
                                                        right   =   0
                                                    )
                                    )
        
        
        self.customize_profile      =   ft.AlertDialog(
            
                                        modal       =   True,
                                        content     =   self.all_row_custprof,
                                        bgcolor     =   "White"
                                    ) 
        
        ##      RETHINK GOALS   ##
        
        self.rethink_txt            =   ft.Text(
            
                                        value       =   "rethink", 
                                        size        =   25, 
                                        color       =   "#0C2D57", 
                                        weight      =   ft.FontWeight.BOLD,
                                        text_align  =   ft.TextAlign.CENTER
                                    
                                    )
        
        
        self.goal_txt              =   ft.Text(
            
                                        value       =   "Goal",
                                        weight      =   ft.FontWeight.BOLD, 
                                        color       =   "#0C2D57", 
                                        text_align  =   ft.TextAlign.CENTER,
                                        size        =   25
                                        
                                    )
        
        
        self.text_stack_retgoals    =   ft.Stack(
            
                                        [self.rethink_txt,
                                            
                                            ft.Container(
                                                
                                                        content     =   self.goal_txt,
                                                        width       =   95,
                                                        height      =   33,
                                                        alignment   =   ft.alignment.bottom_right,
                                                        margin      =   ft.Margin(
                                                                        
                                                                        top     =   25,
                                                                        left    =   0,
                                                                        bottom  =   0,
                                                                        right   =   0
                                                                    )
                                            )
                                        ]
                                    )
        
        
        self.gender_slider      =   ft.CupertinoSlidingSegmentedButton(
                                
                                    controls        =   [
                                        
                                                        ft.Text("Male",     color = "White"),
                                                        ft.Text("Female",   color = "White")
                                                    ],
                                    thumb_color     =   "#DD5746",
                                    width           =   200,
                                    selected_index  =   0,
                                    bgcolor         =   "#9BB0C1"
                                )
                        
        
        self.age_txtf           =   defa.TxtF(
            
                                    label   =   "Age",
                                    h_text  =   "18 - 60"
                                    
                                ).c_dtxtf
        
        
        self.height_txtf        =   defa.TxtF(
                                
                                    label   =   "Height",
                                    h_text  =   "in cm"
                                    
                                ).c_dtxtf
        
        
        self.weight_txtf        =   defa.TxtF(
                                
                                    label       =   "Weight",
                                    h_text      =   "in kg"

                                ).c_dtxtf

        
        self.activity_level     =   ft.Dropdown(
                                
                                    label           =   "Activity Label",
                                    width           =   200,
                                    options         =   [
                                                    
                                                        ft.dropdown.Option("Sedentary"),
                                                        ft.dropdown.Option("Lightly Active"),
                                                        ft.dropdown.Option("Moderately Active"),
                                                        ft.dropdown.Option("Active")
                                                    ],
                                    color           =   "#0C2D57",
                                    border_color    =   "#0C2D57",
                                    bgcolor         =   "White"       
                                )
            
        
        self.goal               =   ft.Dropdown(
                                
                                    label       =   "Goal",
                                    width       =   200,
                                    options     =   [
                                                
                                                    ft.dropdown.Option("Maintain"),
                                                    ft.dropdown.Option("Mild Weight Loss"),
                                                    ft.dropdown.Option("Weight Loss")
                                                ],
                                    color       =   "#0C2D57",
                                    border_color=   "#0C2D57",
                                    bgcolor     =   "White"       
                                )
        
        
        self.elem_column_2        =   ft.Column(
            
                                    controls    =   [   
                                                    
                                                        self.gender_slider,
                                                        self.age_txtf,
                                                        self.height_txtf,
                                                        self.weight_txtf,
                                                        self.activity_level,
                                                        self.goal,
                                                        self.sub_cancel_buttons
                                                    ], 
                                    spacing     =   11
                                    
                                )

        
        self.all_row_retgoal        =   ft.Container(
                                    
                                        content     =   ft.Row(
                
                                                        controls    =   [
                                                                            self.text_stack_retgoals,
                                                                            self.elem_column_2
                                                                        ],
                                                        
                                                        alignment   =   ft.MainAxisAlignment.CENTER,
                                                        spacing     =   26,
                                                        width       =   420,
                                                        height      =   410
                                                    ),
                                        
                                        margin      =   ft.Margin(
                                                        
                                                        top     =   20, 
                                                        left    =   -20, 
                                                        bottom  =   0, 
                                                        right   =   0
                                                    )
                                    )
   
   
        self.rethink_goals          =   ft.AlertDialog(
            
                                        modal       =   True,
                                        content     =   self.all_row_retgoal,
                                        bgcolor     =   "White"
                                    ) 
        
        ##      HOME    ##
        
        self.add_button             =   ft.FloatingActionButton(
                                        
                                        content     =   ft.Row(
                                            [
                                                ft.Icon(ft.icons.ADD, color = "White", size = 20), 
                                                ft.Text("Meal", color = "White", size = 20)
                                            ],
                                            
                                            alignment   =   "center", 
                                            spacing     =   5
                                        ),
                                        
                                        icon        =   ft.icons.ADD,
                                        bgcolor     =   "#DD5746",
                                        shape       =   ft.RoundedRectangleBorder(radius = 5),
                                        width       =   115,
                                        height      =   45,
                                        mini        =   True
                                    )
        
        self.username_txt           =   ft.Row(
                                        
                                        controls    =   [
                                            
                                                        ft.Icon(
                                                            
                                                            ft.icons.PERSON_2_ROUNDED, 
                                                            color   =   "#0C2D57",
                                                            size    =   25
                                                            ),
                                                        
                                                        ft.Text(
                                                            value   =   "kcalori ~ Username",
                                                            color   =   "#0C2D57",
                                                            style   =   ft.TextStyle(
                                                                    
                                                                        size    =   25,
                                                                        weight  =   ft.FontWeight.BOLD
                                                                    )     
                                                            )
                                                        ],
                                        
                                        alignment   =   ft.MainAxisAlignment.CENTER,
                                        
                                    )
        
        self.yest_prog              =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                            ft.Text(
                                                                    "yesterday · ",
                                                                    color   =   "#0C2D57",
                                                                    size    =   20,
                                                                    style   =   ft.TextStyle(weight = ft.FontWeight.BOLD),
                                                                    spans   =   [
                                                                                
                                                                                ft.TextSpan(
                                                                                    "94%"
                                                                                )
                                                                            ]
                                                                ),
                                                            
                                                            ft.ProgressBar(
                                                                width   =   235,
                                                                bar_height  =   15,
                                                                bgcolor =   "#0C2D57",
                                                                value   =   0.94,
                                                                border_radius   =   ft.border_radius.all(10),
                                                            )
                                                        ],
                                            
                                            spacing     =   10
                                            
                                        ),
                                        width       =   285,
                                        height      =   115,
                                        m_top       =   10
                                        
                                    ).c_dCont
        
        self.today_prog             =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                            ft.Text(
                                                                    "today · ",
                                                                    color   =   "#0C2D57",
                                                                    size    =   20,
                                                                    style   =   ft.TextStyle(weight = ft.FontWeight.BOLD),
                                                                    spans   =   [
                                                                                
                                                                                ft.TextSpan(
                                                                                    "46%"
                                                                                )
                                                                            ]
                                                                ),
                                                            
                                                            ft.ProgressBar(
                                                                width   =   235,
                                                                bar_height  =   15,
                                                                bgcolor =   "#0C2D57",
                                                                value   =   0.46,
                                                                border_radius   =   ft.border_radius.all(10),
                                                            )
                                                        ],
                                            
                                            spacing     =   10
                                            
                                        ),
                                        
                                        width       =   285,
                                        height      =   115,
                                        m_top       =   10
                                        
                                    ).c_dCont
        
        self.tomo_prog             =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                            ft.Text(
                                                                
                                                                "tomorrow · ",
                                                                color   =   "#0C2D57",
                                                                size    =   20,
                                                                style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                            ),
                                                            
                                                            ft.Text(
                                                                
                                                                "2,048",
                                                                color   =   "#0C2D57",
                                                                size    =   25,
                                                                style   =   ft.TextStyle(weight = ft.FontWeight.BOLD),
                                                                spans   =   [
                                                                            
                                                                            ft.TextSpan(
                                                                                " calories",
                                                                                style   =   ft.TextStyle(
                                                                                            size   =   20
                                                                                        )
                                                                            )
                                                                        ],
                                                                text_align  =   ft.TextAlign.CENTER
                                                            )
                                                        ],
                                            
                                            spacing     =   0
                                            
                                        ),
                                        
                                        width       =   285,
                                        height      =   115,
                                        m_top       =   10
                                        
                                    ).c_dCont
        
        self.three_days_prog_row    =   ft.Row(
            
                                        controls    =   [
                                            
                                                        self.yest_prog,
                                                        self.today_prog,
                                                        self.tomo_prog
                                                    ],
                                        
                                        spacing     =   30,
                                        alignment   =   ft.MainAxisAlignment.CENTER
                                    )
        
        self.meals_today_exp        =   ft.ExpansionTile(
                                                                
                                        title       =   ft.Row(
                                                    
                                                        controls    =   [
                                                            
                                                                        ft.Text(
                                                                            
                                                                            "Meal 1", 
                                                                            text_align  =   ft.TextAlign.LEFT,
                                                                            style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                                        ),
                                                                        
                                                                        ft.Text(
                                                                            
                                                                            "492", 
                                                                            text_align  =   ft.TextAlign.RIGHT,
                                                                            style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                                        )
                                                                    ],
                                                        
                                                        alignment   =   ft.MainAxisAlignment.SPACE_BETWEEN
                                                    ),  
                                        
                                        controls    =   [
                                                        
                                                            ft.ListTile(
                                                                            
                                                            title   =   ft.Row(
                                                
                                                                    controls    =   [
                                                        
                                                                                    ft.Text(
                                                                                        
                                                                                        "Nilaga", 
                                                                                        text_align  =   ft.TextAlign.LEFT
                                                                                    ),
                                                                                    
                                                                                    ft.Text(
                                                                                        
                                                                                        "312", 
                                                                                        text_align  =   ft.TextAlign.RIGHT
                                                                                    )
                                                                                ],
                                                            
                                                                    alignment   =   ft.MainAxisAlignment.SPACE_BETWEEN
                                                                )       
                                                            ),
                                                                
                                                            ft.ListTile(
                                                                
                                                                title   =   ft.Row(
                                                    
                                                                        controls    =   [
                                                            
                                                                                        ft.Text(
                                                                                            
                                                                                            "Shake", 
                                                                                            text_align  =   ft.TextAlign.LEFT
                                                                                        ),
                                                                                        
                                                                                        ft.Text(
                                                                                            
                                                                                            "101", 
                                                                                            text_align  =   ft.TextAlign.RIGHT
                                                                                        )
                                                                                    ],
                                                        
                                                                        alignment   =   ft.MainAxisAlignment.SPACE_BETWEEN
                                                                    )       
                                                            )
                                                        ],
                                        
                                        shape                   =   ft.RoundedRectangleBorder(radius = 10),
                                        collapsed_shape         =   ft.RoundedRectangleBorder(radius = 10),
                                        collapsed_text_color    =   "#0C2D57",
                                        collapsed_bgcolor       =   "White",
                                        bgcolor         =   "#0C2D57",    
                                        text_color      =   "White"
                                    )
        
        self.log_today              =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                
                                                            ft.Text(
                                                                
                                                                " meals today",
                                                                color   =   "#0C2D57",
                                                                size    =   20,
                                                                style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                            ),
                                                            
                                                            self.meals_today_exp,
                                                            self.meals_today_exp,
                                                            self.meals_today_exp
                                                            
                                                        ],
                                            
                                            spacing     =   10,
                                            scroll      =   ft.ScrollMode.AUTO
                                            
                                        ),
                                        
                                        width       =   442,
                                        height      =   400,
                                        m_top       =   15
                                        
                                        
                                        
                                    ).c_dCont
        
        
        self.pcprog_today           =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                
                                                            ft.Text(
                                                                
                                                                " progress today",
                                                                color   =   "#0C2D57",
                                                                size    =   20,
                                                                style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                            ),
                                                            
                                                            ft.PieChart(
                                                                
                                                                sections    =   [
                                                                                
                                                                                ft.PieChartSection(
                                                                                    25,
                                                                                    title       =   "Meal 1",
                                                                                    title_style =   ft.TextStyle(
                                                                                                    color   =   "white",
                                                                                                    size    =   15,
                                                                                                    weight  =   ft.FontWeight.BOLD
                                                                                                ),
                                                                                    color       =   ft.colors.BLUE,
                                                                                    radius      =   120
                                                                                ),
                                                                                
                                                                                ft.PieChartSection(
                                                                                    30,
                                                                                    title       =   "Meal 3",
                                                                                    title_style =   ft.TextStyle(
                                                                                                    color   =   "white",
                                                                                                    size    =   15,
                                                                                                    weight  =   ft.FontWeight.BOLD
                                                                                                ),
                                                                                    color       =   ft.colors.RED,
                                                                                    radius      =   120
                                                                                ),
                                                                                
                                                                                ft.PieChartSection(
                                                                                    60,
                                                                                    title       =   "Remaining",
                                                                                    title_style =   ft.TextStyle(
                                                                                                    color   =   "white",
                                                                                                    size    =   15,
                                                                                                    weight  =   ft.FontWeight.BOLD
                                                                                                ),
                                                                                    color       =   "#0C2D57",
                                                                                    radius      =   120
                                                                                ),
                                                                            ],
                                                                
                                                                sections_space      =   0,
                                                                center_space_radius =   30,
                                                                expand              =   True
                                                            )
                                                            
                                                        ],
                                            
                                            spacing     =   0
                                            
                                        ),
                                        
                                        width       =   442,
                                        height      =   400,
                                        m_top       =   15
                                        
                                        
                                    ).c_dCont
        
        self.logs_today_row         =   ft.Row(
                                        
                                        controls    =   [
                                                        
                                                        self.log_today,
                                                        self.pcprog_today
                                                    ],
                                        
                                        spacing     =   30,
                                        alignment   =   ft.MainAxisAlignment.CENTER   
                                    )
        
        self.all_elements_col_home  =   ft.Column(
                                        
                                        controls    =   [
                                                        
                                                        self.username_txt,
                                                        self.three_days_prog_row,
                                                        self.logs_today_row
                                                    ],
                                        
                                        spacing     =   10,
                                        alignment   =   ft.MainAxisAlignment.CENTER
                                    )
        
        self.test                   =   defa.Btn(
                                        
                                        "Test"
                                        
                                    ).c_debtn
        
        ## VIEW USER LOG ##
        
        self.view_log_txt           =   ft.Row(
                                        
                                        controls    =   [
                                            
                                                        ft.Icon(
                                                            
                                                            ft.icons.FASTFOOD_SHARP, 
                                                            color   =   "#0C2D57",
                                                            size    =   25
                                                            ),
                                                        
                                                        ft.Text(
                                                            value   =   "kcalori ~ ur meal logs",
                                                            color   =   "#0C2D57",
                                                            style   =   ft.TextStyle(
                                                                    
                                                                        size    =   25,
                                                                        weight  =   ft.FontWeight.BOLD
                                                                    )     
                                                            )
                                                        ],
                                        
                                        alignment   =   ft.MainAxisAlignment.CENTER,
                                        
                                    )
        
        def change_date(e):
            
            self.date = self.date_picker.value
            self.date_txt.value = self.date.strftime("%b %d %Y")
            self.parent.update()
                    
        self.date_picker            =   ft.DatePicker(

                                        on_change   =   change_date,
                                        first_date  =   datetime.datetime(2024, 1, 1)
                                    )
        
        self.parent.overlay.append(self.date_picker)
        
        self.date_txt               =   ft.Text(
            
                                        value   =   "",
                                        color   =   "#0C2D57",
                                        style   =   ft.TextStyle(
                                            
                                                size    =   19,
                                                weight  =   ft.FontWeight.BOLD
                                            )
                                    )

        self.date_button_disp       =   ft.Row(
                                        
                                        controls    =   [
                                            
                                                        defa.Btn(
                
                                                            text        =   "Select date here",
                                                            height      =   35,
                                                            icon        =   ft.icons.CALENDAR_MONTH,
                                                            on_click    =   lambda _: self.date_picker.pick_date(),
                                                            alignment   =   ft.MainAxisAlignment.CENTER
                                            
                                                        ).c_debtn,
                                                        
                                                        defa.Cont(
                                                            
                                                            ft.Row(
                                                                controls    =   [
                                                                    
                                                                                self.date_txt
                                                                            ],
                                                                alignment   =   ft.MainAxisAlignment.CENTER 
                                                                ),
                                                            
                                                            width  = 200,
                                                            height = 45,
                                                            padding =   ft.padding.all(5)
                                                            
                                                        ).c_dCont
                                                        
                                                        ],
                                        
                                        alignment   =   ft.MainAxisAlignment.CENTER
                                    )
        
        self.meals_today_exp        =   ft.ExpansionTile(
                                                                
                                        title       =   ft.Row(
                                                    
                                                        controls    =   [
                                                            
                                                                        ft.Text(
                                                                            
                                                                            "Meal 1", 
                                                                            text_align  =   ft.TextAlign.LEFT,
                                                                            style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                                        ),
                                                                        
                                                                        ft.Text(
                                                                            
                                                                            "492", 
                                                                            text_align  =   ft.TextAlign.RIGHT,
                                                                            style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                                        )
                                                                    ],
                                                        
                                                        alignment   =   ft.MainAxisAlignment.SPACE_BETWEEN
                                                    ),  
                                        
                                        controls    =   [
                                                        
                                                            ft.ListTile(
                                                                            
                                                            title   =   ft.Row(
                                                
                                                                    controls    =   [
                                                        
                                                                                    ft.Text(
                                                                                        
                                                                                        "Nilaga", 
                                                                                        text_align  =   ft.TextAlign.LEFT
                                                                                    ),
                                                                                    
                                                                                    ft.Text(
                                                                                        
                                                                                        "312", 
                                                                                        text_align  =   ft.TextAlign.RIGHT
                                                                                    )
                                                                                ],
                                                            
                                                                    alignment   =   ft.MainAxisAlignment.SPACE_BETWEEN
                                                                )       
                                                            ),
                                                                
                                                            ft.ListTile(
                                                                
                                                                title   =   ft.Row(
                                                    
                                                                        controls    =   [
                                                            
                                                                                        ft.Text(
                                                                                            
                                                                                            "Shake", 
                                                                                            text_align  =   ft.TextAlign.LEFT
                                                                                        ),
                                                                                        
                                                                                        ft.Text(
                                                                                            
                                                                                            "101", 
                                                                                            text_align  =   ft.TextAlign.RIGHT
                                                                                        )
                                                                                    ],
                                                        
                                                                        alignment   =   ft.MainAxisAlignment.SPACE_BETWEEN
                                                                    )       
                                                            )
                                                        ],
                                        
                                        shape                   =   ft.RoundedRectangleBorder(radius = 10),
                                        collapsed_shape         =   ft.RoundedRectangleBorder(radius = 10),
                                        collapsed_text_color    =   "#0C2D57",
                                        collapsed_bgcolor       =   "White",
                                        bgcolor         =   "#0C2D57",    
                                        text_color      =   "White"
                                    )
        
        self.log_on_date            =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                
                                                            ft.Text(
                                                                
                                                                " meals today",
                                                                color   =   "#0C2D57",
                                                                size    =   20,
                                                                style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                            ),
                                                            
                                                            self.meals_today_exp,
                                                            self.meals_today_exp,
                                                            self.meals_today_exp
                                                            
                                                        ],
                                            
                                            spacing     =   10,
                                            scroll      =   ft.ScrollMode.AUTO
                                            
                                        ),
                                        
                                        width       =   442,
                                        height      =   460,
                                        m_top       =   15
                                        
                                        
                                        
                                    ).c_dCont
        
        
        self.pcprog_on_date         =   defa.Cont(

                                        ft.Column(
                                        
                                            controls    =   [
                                                
                                                            ft.Text(
                                                                
                                                                " progress today",
                                                                color   =   "#0C2D57",
                                                                size    =   20,
                                                                style   =   ft.TextStyle(weight = ft.FontWeight.BOLD)
                                                            ),
                                                            
                                                            ft.PieChart(
                                                                
                                                                sections    =   [
                                                                                
                                                                                ft.PieChartSection(
                                                                                    25,
                                                                                    title       =   "Meal 1",
                                                                                    title_style =   ft.TextStyle(
                                                                                                    color   =   "white",
                                                                                                    size    =   15,
                                                                                                    weight  =   ft.FontWeight.BOLD
                                                                                                ),
                                                                                    color       =   ft.colors.BLUE,
                                                                                    radius      =   120
                                                                                ),
                                                                                
                                                                                ft.PieChartSection(
                                                                                    30,
                                                                                    title       =   "Meal 3",
                                                                                    title_style =   ft.TextStyle(
                                                                                                    color   =   "white",
                                                                                                    size    =   15,
                                                                                                    weight  =   ft.FontWeight.BOLD
                                                                                                ),
                                                                                    color       =   ft.colors.RED,
                                                                                    radius      =   120
                                                                                ),
                                                                                
                                                                                ft.PieChartSection(
                                                                                    60,
                                                                                    title       =   "Remaining",
                                                                                    title_style =   ft.TextStyle(
                                                                                                    color   =   "white",
                                                                                                    size    =   15,
                                                                                                    weight  =   ft.FontWeight.BOLD
                                                                                                ),
                                                                                    color       =   "#0C2D57",
                                                                                    radius      =   120
                                                                                ),
                                                                            ],
                                                                
                                                                sections_space      =   0,
                                                                center_space_radius =   30,
                                                                expand              =   True
                                                            )
                                                            
                                                        ],
                                            
                                            spacing     =   0
                                            
                                        ),
                                        
                                        width       =   442,
                                        height      =   460,
                                        m_top       =   15
                                        
                                        
                                    ).c_dCont
        
        self.logs_on_date_row       =   ft.Row(
                                        
                                        controls    =   [
                                                        
                                                        self.log_on_date,
                                                        self.pcprog_on_date
                                                    ],
                                        
                                        spacing     =   30,
                                        alignment   =   ft.MainAxisAlignment.CENTER   
                                    )
        
        self.all_elements_col_ml    =   ft.Column(
                                        
                                        controls    =   [
                                                        
                                                        self.view_log_txt,
                                                        self.date_button_disp,
                                                        self.logs_on_date_row
                                                    ],
                                        
                                        spacing     =   20,
                                        alignment   =   ft.MainAxisAlignment.CENTER
                                    )
        
    def build_home(self):
        
        self.page_properties.apply(self.parent)

        return self.all_elements_col_home, self.add_button, self.navi, self.page_properties
    
    
    def close_cusprof(self, e):
        
        self.customize_profile.open  =  False
        self.navi.selected_index     =  2
        self.parent.update()
        
        
    def close_retgoal(self, e):
        
        self.rethink_goals.open     =  False
        self.navi.selected_index    =  2
        self.parent.update()
    
    
    def handle_change_tab(self, e):
        
        selected_index = e.control.selected_index
        
        if selected_index == 0:
            
            self.parent.dialog              =   self.customize_profile
            self.customize_profile.open     =   True
            self.parent.update()
                        
            self.cancel_button.on_click     =   self.close_cusprof
            
        elif selected_index == 1:
            
            self.parent.dialog              =   self.rethink_goals
            self.rethink_goals.open         =   True
            self.parent.update()
            
            self.cancel_button.on_click     =   self.close_retgoal
            
        elif selected_index == 2:
            
            self.all_elements_col_home.visible = True
            self.add_button.visible = True
            
            self.all_elements_col_ml.visible = False
            self.parent.update()
            
        elif selected_index == 3:
            
            self.all_elements_col_home.visible = False
            self.add_button.visible = False
            
            self.all_elements_col_ml.visible = True
            
            self.parent.add(self.all_elements_col_ml)
            self.parent.update()
            
            
        elif selected_index == 4:
            
            pass
            



        

        

        
    