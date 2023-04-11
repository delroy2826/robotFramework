from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
import time


@library
class Shop:

    __product_card_add_btn = "//a[text()='{0}']//ancestor::div[@class='card-body']//following-sibling::div[" \
                     "@class='card-footer']//button"
    __checkout_btn = None

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello ->>>>>>>>>>")

    @keyword
    def add_product_to_cart(self, productList):
        for product in productList:
            self.selLib.click_element(self.__product_card_add_btn.format(product))
            time.sleep(4)

