*** Settings ***
Documentation   To Validate Login Form
Library     SeleniumLibrary
Library    Collections
Test Setup    Open the browser with the mortage payment URL
Test Teardown   close browser session
Resource    ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}  xpath://div[contains(@class,'alert-danger')]
${Checkout_btn}     xpath://a[contains(text(),'Checkout')]
${Expected_Error_Message_Login}     Incorrect username/password.
${input_username_field}     xpath://input[@name="username"]
${input_password_field}     id:password
${btn_sign_in}  xpath://input[@id="signInBtn"]
${btn_login_okay_btn}   xpath://button[@id="okayBtn"]
${drop_down_login_page}     xpath://select[@class="form-control"]
${chk_bx_terms_and_condition}   xpath://label[@for="terms"]//span//input

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    ALL  SMOKE
    Fill the login form     ${username}     ${invalid_pw}
    Wait until element is located in the page   ${Error_Message_Login}
    Verify error message is correct

Validate cards display in the shopping page
    [Tags]    ALL  SMOKE
    Fill the login form     ${username}     ${password}
    Wait until element is located in the page   ${Checkout_btn}
    Verify card titles in the Shop Page
    Select the card     Blackberry

Select the form and navigate to child window
    [Tags]    ALL  SMOKE
    Fill The Login Details and Select The User Option   ${username}     ${password}    ${radio_btnuser}     ${drp_down_teach}
    Wait until element is located in the page   ${Checkout_btn}

*** Keywords ***
Fill the login form
    [Arguments]    ${username}  ${password}
    Input Text   ${input_username_field}    ${username}
    Input Password  ${input_password_field}   ${password}
    Click Button     ${btn_sign_in}

Wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible   ${element}    10

Verify error message is correct
    ${result} =  Get Text     ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   ${Expected_Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    ${Expected_Error_Message_Login}

Verify card titles in the Shop Page
    @{expected_list} =  Create List    iphone X  Samsung Note 8  Nokia Edge  Blackberry
    ${actual_list} =  Get Webelements    xpath://h4[@class="card-title"]//a
    @{actual_product_list} =    Create List
    FOR     ${element}      IN      @{actual_list}
        Append To List  ${actual_product_list}   ${element.text}
    END
    Log To Console    ${actual_product_list}
    Lists Should Be Equal   ${expected_list}    ${actual_product_list}

#Select the card
#    [Arguments]     ${cardname}
#    ${actual_list} =  Get Webelements    xpath://h4[@class="card-title"]//a
#    ${index_number} =   Set Variable    1
#    FOR     ${element}  IN  @{actual_list}
#        Exit For Loop If   '${cardname}' =='${element.text}'
#        ${index_number}=   Evaluate    ${index_number}+1
#    END
#    Click Button    (//button[contains(text(),'Add')])[${index_number}]

Fill The Login Details and Select The User Option
    [Arguments]    ${username}  ${password}     ${radio_button}     ${drp_down_teach}
    Input Text   ${input_username_field}    ${username}
    Input Password  ${input_password_field}   ${password}
    Select Radio Button     radio   ${radio_button}
    Sleep    1s
    Wait Until Element Is Visible    ${btn_login_okay_btn}
    Click Element    ${btn_login_okay_btn}
    Select From List By Value    ${drop_down_login_page}  ${drp_down_teach}
    Select Checkbox     ${chk_bx_terms_and_condition}
    Sleep    3s
    Click Button     ${btn_sign_in}
    Sleep    3s

Select the card
    [Arguments]     ${cardname}
    ${actual_list} =  Get Webelements    xpath://h4[@class="card-title"]//a
    ${index_number} =   Set Variable    1
    FOR     ${element}  IN  @{actual_list}
        Exit For Loop If   '${cardname}' =='${element.text}'
        ${index_number}=   Evaluate    ${index_number}+1
    END
    Click Button    (//button[contains(text(),'Add')])[${index_number}]


