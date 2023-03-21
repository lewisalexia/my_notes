# 1
def is_two(var1):
    if var1 == str('2') or var1 == 2:
        return True
    else:
        return False

# 2
vowel_list = ('a','e','i','o','u')
def is_vowel(char):
    return char.lower() in vowel_list
    
# 3
def is_consonant(char):
    return char.lower() not in vowel_list

# 4
def whole_word(string):
    if type(string) == str:
        if string.isalpha() == True:
            if (string[0]).lower() not in vowel_list:
                return string.capitalize()
            else:
                return False
    else:
        return False

# 5
def calculate_tip(subtotal,percentage=.2):
    if percentage <= 0.9 and percentage >= 0.0:
        return percentage * subtotal
    else:
        return ("Error")
    
# 6
def apply_discount(original_price,discount_percent):
    return original_price - original_price * discount_percent

# 7
def handle_commas(string_int_commas):
    return int(string_int_commas.replace(",",""))

# 8
def get_letter_grade(number):
    if number >=88:
        return("A")
    elif number >=80:
        return("B")
    elif number >=67:
        return("C")
    elif number >=60:
        return("D")
    else:
        return("F")
    
# 9
def remove_vowels(bad_string):
    for char in vowel_list:
        bad_string = bad_string.replace(char,"")
    return bad_string

# 10
def normalize_name(dirty_data):
    for char in dirty_data:
        strip_data = dirty_data.strip()
        lwr_strip_data = strip_data.lower()
        clean_data = lwr_strip_data.replace(" ","_",)
        super_clean_data = clean_data.replace("!@#$%^&*","")
        return super_clean_data.strip("_")

# 11
def cumulative_sum(random_list): 
    cu_list = []
    length = len(random_list) 
    cu_list = [sum(random_list[0:x:1]) for x in range(0, length+1)] 
    return cu_list[1:]
