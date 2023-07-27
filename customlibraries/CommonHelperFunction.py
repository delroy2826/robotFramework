from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
import time
import random


@library
class CommonHelperFunction:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def get_random_key_value_from_dict(self, dict_data):
        index_key = random.randint(0, len(dict_data)-1)
        key_lang = list(dict_data.keys())[index_key]
        index_value = random.randint(0, len(dict_data[key_lang]) - 1)
        value_num = dict_data[key_lang][index_value]
        return key_lang, value_num
