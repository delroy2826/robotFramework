*** Settings ***
Documentation   To Validate Login Form
Library     SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open the browser with the mortage payment URL
Test Teardown   close browser session
Resource    ../PO/Generic.robot


*** Variables ***
${lnk_blinking_txt}     xpath://a[@class="blinkingText"]
${txt_email}    xpath://p[contains(text(),'email')]//strong//a
${input_username_field}     xpath://input[@name="username"]
${expected_child_url}   https://rahulshettyacademy.com/documents-request

*** Test Cases ***
Validate Child Window Functionality
    [Tags]    ALL  SANITY
    Select The link to Child Window
    ${handles}=     Verify the user is switched to Child Window
    ${email_id}=    Grab the Email ID in the child Window
    Switch to Parent window and enter the email     ${handles}  ${email_id}

*** Keywords ***
Select The link to Child Window
    Wait Until Element Is Visible   ${lnk_blinking_txt}
    Click Link    ${lnk_blinking_txt}

Verify the user is switched to Child Window
    ${handles}=     Get Window Handles
    Switch Window    ${handles}[1]
    ${actual_url}=   Get Location
    Should Be Equal As Strings  ${actual_url}   ${expected_child_url}
    [Return]      ${handles}

Grab the Email ID in the child Window
    ${email_id}=    Get Text    ${txt_email}
    Close Window
    [Return]    ${email_id}

Switch to Parent window and enter the email
    [Arguments]    ${handles}   ${email_id}
    Switch Window    ${handles}[0]
    Input Text   ${input_username_field}    ${email_id}
    Sleep    5s

