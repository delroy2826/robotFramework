*** Settings ***
Documentation   To Validate Login Form
Library     SeleniumLibrary
Test Setup    open browser with with defined browser
Test Teardown   close browser session
Resource    ../PO/LandingPage.robot
Resource    ../PO/Generic.robot
Library    DataDriver       file=resources/data.csv    encoding=utf-8
#Test Template    Validate Unsuccessful Login 2

*** Test Cases ***

Test Case 1
    [Tags]    ALL  REGRESSION
    [Template]    Validate Unsuccessful Login 2
    ${username}    ${password}

*** Keywords ***
Validate Unsuccessful Login 2
    [Arguments]     ${username}    ${password}
    Fill the login form     ${username}     ${password}
    Wait until it checks and display error message
    Verify error message is correct