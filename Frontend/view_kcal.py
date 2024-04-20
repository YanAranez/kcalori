import flet as ft
import control_kcal as cntrl
import default as defa
        
class Registerlogin_Page():
    
    def __init__(self, parent):
        
        self.parent             =   parent
        
        
        self.page_properties    =   defa.Page(
            
                                        "Register/Login Page", 
                                        ft.MainAxisAlignment.CENTER
                                        
                                    )

    def build(self):
        
        self.page_properties.apply(self.parent)
        
        
        self.kcalori_text        =   ft.Text(
            
                                    value       =   "kcalori", 
                                    size        =   50, 
                                    weight      =   ft.FontWeight.BOLD, 
                                    color       =   "#0C2D57", 
                                    text_align  =   ft.TextAlign.CENTER
                            )
        
        
        self.signup_btn          =   defa.Btn(
            
                                    "Register", 
                                    icon    =   "assignment_add"
                                
                            ).c_debtn
        
        
        self.login_btn           =   defa.Btn(
            
                                    "Log In", 
                                    icon    =   "assignment_ind_outlined"
                                
                            ).c_debtn
        
        
        self.buttons_column      =   ft.Column(
            
                                    controls =  [self.signup_btn, self.login_btn], 
                                    spacing  =  3
                                    
                            )
        
        
        self.all_elements_row    =   ft.Row(
            
                                    controls    =   [self.kcalori_text, self.buttons_column], 
                                    spacing     =   15, 
                                    alignment   =   ft.MainAxisAlignment.CENTER
                                
                            )


        return  self.all_elements_row, self.page_properties
        
class Login_Page:
    
    def __init__(self, parent):
        
        self.parent             =   parent
        
        self.page_properties    =   defa.Page(
            
                                    "Login Page", 
                                    ft.MainAxisAlignment.CENTER
                                    
                                )

    def build(self):
        
        self.page_properties.apply(self.parent)
        
        
        self.login_text          =   ft.Text(
            
                                    value       =   "Login", 
                                    size        =   45, 
                                    weight      =   ft.FontWeight.BOLD, 
                                    color       =   "#0C2D57", 
                                    text_align  =   ft.TextAlign.CENTER
                                
                            )
        
        
        self.username_text_field =   defa.TxtF(
            
                                    label   =   'Username',
                                    
                            ).c_dtxtf

        
        self.password_text_field =   defa.TxtF(
            
                                    label       =   'Password',
                                    password    =   True,
                                    c_r_pw      =   True
                                
                            ).c_dtxtf
        
        
        self.login_button        =   defa.Btn(
            
                                    "Login",
                                    height      =   30,
                                    disabled    =   True
                                
                            ).c_debtn
        
        
        self.return_button       =   defa.Btn(
            
                                    "Return"
                                    
                            ).c_debtn
        
        
        self.sub_ret_button      =   ft.Row(
            
                                    controls    =   [self.return_button, self.login_button], 
                                    spacing     =   3
                                
                            )
        
        
        self.elem_column         =   ft.Column(
            
                                    controls    =   [self.username_text_field, self.password_text_field, self.sub_ret_button], 
                                    spacing     =   11
                                    
                            )
        
        
        self.all_row             =   ft.Row(
                                controls    =   [self.login_text,self.elem_column], 
                                alignment   =   ft.MainAxisAlignment.CENTER,
                                spacing     =   26
                            )


        return self.all_row, self.page_properties

class Signup_Page():
    
    def __init__(self, parent):
        
        self.parent             =   parent
        
        self.page_properties    =   defa.Page(
            
                                    "Register Page",
                                    ft.MainAxisAlignment.CENTER
                                        
                                )
        
    def build_wind1(self):
        
        self.page_properties.apply(self.parent)
        
        
        signup_text         =   ft.Text(
            
                                value       =   "Register", 
                                size        =   45, 
                                weight      =   ft.FontWeight.BOLD, 
                                color       =   "#0C2D57", 
                                text_align  =   ft.TextAlign.CENTER
                                    
                            )
        
        
        user_profile_text   =   ft.Text(
            
                                value       =   "User Profile", 
                                size        =   15, 
                                color       =   "#0C2D57", 
                                text_align  =   ft.TextAlign.CENTER
                                
                            )
        
        
        text_stack          =   ft.Stack(
            
                                [signup_text,
                                    
                                    ft.Container(
                                        
                                        content     =   user_profile_text,
                                        width       =   189,
                                        height      =   80,
                                        alignment   =   ft.alignment.bottom_right
                                        
                                                )
                                ]
                            )   
        
        
        first_name          =   defa.TxtF(
            
                                label   =   "First Name"
                                    
                            ).c_dtxtf
        
        
        last_name           =   defa.TxtF(
            
                                label   =   "Last Name"
                                    
                            ).c_dtxtf
        
        
        self.username_text_field =   defa.TxtF(
            
                                label   =   "Username"
                                    
                            ).c_dtxtf
        
        
        self.password_text_field =   defa.TxtF(
            
                                label       =   "Password",
                                password    =   True,
                                c_r_pw      =   True
                                    
                            ).c_dtxtf
        
        
        
        next_button         =   defa.Btn(
            
                                "Next",
                                disabled    =   True
                                
                            ).c_debtn
        
        
        self.return_button       =   defa.Btn(
            
                                "Return"
                                
                            ).c_debtn
        
        
        self.sub_ret_button      =   ft.Row(
            
                                controls    =   [self.return_button, next_button], 
                                spacing     =   3
                                    
                            )
        
        
        self.elem_column         =   ft.Column(
            
                                controls    =   [   
                                                    first_name,
                                                    last_name,
                                                    self.username_text_field,
                                                    self.password_text_field,
                                                    self.sub_ret_button
                                                ], 
                                spacing     =   11
                                
                            )
        
        
        self.all_row             =   ft.Row(
            
                                controls    =   [
                                                    text_stack, 
                                                    self.elem_column
                                                ],
                                alignment   =   ft.MainAxisAlignment.CENTER,
                                spacing     =   26
                                
                            )
        
        
        return self.all_row, self.page_properties
    
    def build_wind2(self):
        
        self.page_properties.apply(self.parent)
        
        
                
        
        signup_text         =   ft.Text(
            
                                value       =   "Register", 
                                size        =   45, 
                                weight      =   ft.FontWeight.BOLD, 
                                color       =   "#0C2D57", 
                                text_align  =   ft.TextAlign.CENTER
                                    
                            )
        
        
        user_profile_text   =   ft.Text(
            
                                value       =   "Calculate BMR", 
                                size        =   15, 
                                color       =   "#0C2D57", 
                                text_align  =   ft.TextAlign.CENTER
                                    
                            )
        
        
        text_stack          =   ft.Stack(
            
                                [signup_text,
                                    
                                    ft.Container(
                                        
                                        content     =   user_profile_text,
                                        width       =   191,
                                        height      =   80,
                                        alignment   =   ft.alignment.bottom_right
                                        
                                                )
                                ]
                            )   
        
        
        gender_slider       =   ft.CupertinoSlidingSegmentedButton(
                                
                                controls        =   [
                                    
                                                    ft.Text("Male",     color = "White"),
                                                    ft.Text("Female",   color = "White")
                                                ],
                                thumb_color     =   "#DD5746",
                                width           =   200,
                                selected_index  =   0,
                                bgcolor         =   "#9BB0C1"
                            )
                        
        
        age_txtf            =   defa.TxtF(
            
                                label   =   "Age",
                                h_text  =   "18 - 60"
                                
                            ).c_dtxtf
        
        
        height_txtf         =   defa.TxtF(
                                
                                label   =   "Height",
                                h_text  =   "in cm"
                                
                            ).c_dtxtf
        
        
        weight_txtf         =   defa.TxtF(
                                
                                label       =   "Weight",
                                h_text      =   "in kg"

                            ).c_dtxtf

        
        activity_level      =   ft.Dropdown(
                                
                                label       =   "Activity Label",
                                width       =   200,
                                options     =   [
                                            
                                                ft.dropdown.Option("Sedentary"),
                                                ft.dropdown.Option("Lightly Active"),
                                                ft.dropdown.Option("Moderately Active"),
                                                ft.dropdown.Option("Active")
                                            ],
                                color       =   "#0C2D57",
                                border_color=   "#0C2D57",
                                bgcolor     =   "White"       
                            )
        
        
        goal                =   ft.Dropdown(
                                
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
        
        next_button         =   defa.Btn(
            
                                "Register",
                                disabled    =   True
                                
                            ).c_debtn
        
        
        self.return_button       =   defa.Btn(
            
                                "Return"
                                
                            ).c_debtn
        
        
        self.sub_ret_button      =   ft.Row(
            
                                controls    =   [self.return_button, next_button], 
                                spacing     =   3
                                    
                            )
        
        
        self.elem_column         =   ft.Column(
            
                                controls    =   [   
                                                 
                                                    gender_slider,
                                                    age_txtf,
                                                    height_txtf,
                                                    weight_txtf,
                                                    activity_level,
                                                    goal,
                                                    self.sub_ret_button
                                                ], 
                                spacing     =   11
                                
                            )

        self.all_row             =   ft.Row(
            
                                controls    =   [
                                                    text_stack, 
                                                    self.elem_column
                                                ],
                                alignment   =   ft.MainAxisAlignment.CENTER,
                                spacing     =   26
                                
                            )

        return self.all_row, self.page_properties            

class Main_Page:
    
    def __init__(self, parent):
        
        self.parent                         =   parent
        
        
        self.page_properties_main           =   defa.Page(
            
                                                    "Main Page", 
                                                    ft.MainAxisAlignment.CENTER
                                                    
                                            )
        
        
        self.page_properties_log_mean_wind  =   defa.Page(
            
                                                    "Log Meal Window", 
                                                    ft.MainAxisAlignment.CENTER
                                                    
                                            )
    
    def build_main(self):
        
        self.page_properties.apply(self.parent)

    def build_log_meal_wind(self):
        
        self.page_properties.apply(self.parent)

class Sub_Pages:
    
    def __init__(self, parent):
        
        self.parent                 =   parent
        self.page_properties_cpw    =   defa.Page("Customize Profile", 
                                                ft.MainAxisAlignment.CENTER
                                    )
        self.page_properties_voml   =   defa.Page("View Meal Log", 
                                                ft.MainAxisAlignment
                                    )
    
    def build_customize_profile_window(self):
        self.page_properties.apply(self.parent)
    
    def build_view_overall_meal_log(self):
        self.page_properties.apply(self.parent)
        

        

        

        
    