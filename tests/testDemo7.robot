*** Settings ***
Documentation   To Validate Login Form
Library     SeleniumLibrary
Library    Collections
Library    ../customlibraries/Shop.py
Test Setup    open browser with with defined browser
Test Teardown   close browser session
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/CheckoutPage.robot
Resource    ../PO/DocumentRequestPage.robot

*** Variables ***
@{product_to_cart}   Samsung Note 8  Nokia Edge
@{expected_list}    iphone X  Samsung Note 8  Nokia Edge  Blackberry
@{expected_prod_in_checkout}   Samsung Note 8  Nokia Edge
${country_name}     India

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    ALL  REGRESSION
    LandingPage.Fill the login form     ${username}     ${invalid_pw}
    Generic.Wait until element is located in the page   ${Error_Message_Login}
    LandingPage.Verify error message is correct

Validate cards display in the shopping page 1
    [Tags]    ALL  REGRESSION
    LandingPage.Fill the login form     ${username}     ${password}
    Generic.Wait until element is located in the page   ${Checkout_btn}
    ShopPage.Verify card titles in the Shop Page    ${expected_list}
    hello world
    Add Product To Cart    ${product_to_cart}
    Click Element   ${Checkout_btn}
    Generic.Wait until element is located in the page   ${tbl_product}
    CheckoutPage.Validate Expected Product Displayed in Checkout Page   ${expected_prod_in_checkout}
    Click Button    ${btn_checkoutpage}
    CheckoutPage.Select Country and Proceed To Purchase     ${country_name}
    Generic.Wait until element is located in the page   ${txt_success_alert}

Validate cards display in the shopping page 2
    [Tags]    ALL  REGRESSION
    LandingPage.Fill the login form     ${username}     ${password}
    Generic.Wait until element is located in the page   ${Checkout_btn}
    ShopPage.Verify card titles in the Shop Page    ${expected_list}
    Select the card     Blackberry

Select the form and navigate to child window
    [Tags]    ALL  REGRESSION
    LandingPage.Fill The Login Details and Select The User Option   ${username}     ${password}    ${radio_btnuser}     ${drp_down_teach}
    Generic.Wait until element is located in the page   ${Checkout_btn}

Validate Child Window Functionality
    [Tags]    ALL  REGRESSION
    Select The link to Child Window
    ${handles}=     Verify the user is switched to Child Window
    ${email_id}=    Grab the Email ID in the child Window
    Switch to Parent window and enter the email     ${handles}  ${email_id}






