*** Settings ***
Documentation   To Validate Login Form
Library     SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}  xpath://div[contains(@class,'alert-danger')]
${Expected_Error_Message_Login}     Incorrect username/password.
${URL}  https://rahulshettyacademy.com/loginpagePractise/

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    ALL  SMOKE
    Open the browser with the mortage payment URL
    Fill the login form
    Wait until it checks and display error message
    Verify error message is correct

*** Keywords ***
open the browser with the mortage payment URL
    Create Webdriver    Chrome  executable_path=driver/chromedriver.exe
    Go To   ${URL}

Fill the login form
    Input Text   xpath://input[@name="username"]   rahulshettyacademy
    Input Password  id:password   rahulshettyacademy
    Click Button     xpath://input[@id="signInBtn"]

Wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}    10

Verify error message is correct
    ${result} =  Get Text     ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   ${Expected_Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    ${Expected_Error_Message_Login}

