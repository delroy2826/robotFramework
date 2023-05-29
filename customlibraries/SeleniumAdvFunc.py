from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class SeleniumAdvFunc:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def get_location_element(self, ele):
        """ Returns X and Y Co-ordinates in dictionary"""
        loc = self.selLib.find_element(ele)
        data = loc.location
        return data

    @keyword
    def get_color_element_rgba(self, ele):
        """Returns HEX code of the rgba number"""
        loc = self.selLib.find_element(ele)
        rgba = loc.value_of_css_property('background-color')
        start_bracket = rgba.index('(')
        end_bracket = rgba.index(')')
        rgbanum = rgba[start_bracket + 1:end_bracket]
        rm_sp = rgbanum.split(",")
        return '#{:02x}{:02x}{:02x}{:02x}'.format(int(rm_sp[0]), int(rm_sp[1]), int(rm_sp[2]), int(rm_sp[3]))

    @keyword
    def get_color_element_rgb(self, ele):
        """Returns HEX code of the rgb number"""
        loc = self.selLib.find_element(ele)
        rgba = loc.value_of_css_property('background-color')
        start_bracket = rgba.index('(')
        end_bracket = rgba.index(')')
        rgbanum = rgba[start_bracket + 1:end_bracket]
        rm_sp = rgbanum.split(",")
        return '#{:02x}{:02x}{:02x}'.format(int(rm_sp[0]), int(rm_sp[1]), int(rm_sp[2]))

    @keyword
    def get_size_element(self, ele):
        size_dict = self.selLib.find_element(ele)
        size_value = size_dict.size
        return size_value
