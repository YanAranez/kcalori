class Users:
    
    def __init__(self, f_name, l_name, username, pw, gender, age, wt, ht, act_label, goal):
        
        self.f_name     =   f_name
        self.l_name     =   l_name
        self.username   =   username
        self.pw         =   pw
        self.gender     =   gender
        self.age        =   age
        self.wt         =   wt
        self.ht         =   ht
        self.act_label  =   act_label
        self.goal       =   goal

class create_User(Users):
    
    def __init__(self, f_name, l_name, username, pw, gender, age, wt, ht, act_label, goal):
        
        super().__init__(f_name, l_name, username, pw, gender, age, wt, ht, act_label, goal)
        
        pass