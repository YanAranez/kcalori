import json
import control_kcal as ctl

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
        
        user_data = read_User.read()
        
        user_data[self.username] = {
            
            "first_name"        :   self.f_name,
            "last_name"         :   self.l_name,
            "username"          :   self.username,
            "password"          :   self.pw,
            "gender"            :   self.gender,
            "age"               :   self.age,
            "weight"            :   self.wt,
            "height"            :   self.ht,
            "activity_level"    :   self.act_label,
            "goal"              :   self.goal 
        }

        with open("temp_dp.json", "w") as json_file:
            json.dump(user_data, json_file, indent=4)
            
class read_User(Users):
    
    @staticmethod
    
    def read():
        
        try:
            
            with open("temp_dp.json", "r") as json_file:
                
                try:
                    users_data = json.load(json_file)
                    return users_data
                
                except json.JSONDecodeError:
                    return {}
                
        except FileNotFoundError:
            return {}
    
    