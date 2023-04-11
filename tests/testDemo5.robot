*** Settings ***
Documentation   To Validate Login Form
Library     SeleniumLibrary
Library    DataDriver       file=resources/data.csv    encoding=utf-8
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login
#Resource

*** Variables ***
${Error_Message_Login}  xpath://div[contains(@class,'alert-danger')]
${Expected_Error_Message_Login}     Incorrect username/password.
${URL}  https://rahulshettyacademy.com/loginpagePractise/
${input_username_field}     xpath://input[@name="username"]
${input_password_field}     id:password
${btn_sign_in}  xpath://input[@id="signInBtn"]

*** Test Cases ***

Login with user ${username} and password ${password}    abc     1234a
    [Tags]    ALL  REGRESSION

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]     ${username}    ${password}
    Open the browser with the mortage payment URL
    Fill the login form     ${username}     ${password}
    Wait until it checks and display error message
    Verify error message is correct

open the browser with the mortage payment URL
    Create Webdriver    Chrome  executable_path=driver/chromedriver.exe
    Go To   ${URL}

Fill the login form
    [Arguments]    ${username}  ${password}
    Input Text   ${input_username_field}    ${username}
    Input Password  ${input_password_field}   ${password}
    Click Button     ${btn_sign_in}

Wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}    10

Verify error message is correct
    ${result} =  Get Text     ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   ${Expected_Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    ${Expected_Error_Message_Login}

