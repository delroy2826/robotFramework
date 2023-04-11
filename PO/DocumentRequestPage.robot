*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The System specific keywords created from our own
...             Domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library     SeleniumLibrary

*** Variables ***
${expected_child_url}   https://rahulshettyacademy.com/documents-request
${txt_email}    xpath://p[contains(text(),'email')]//strong//a

*** Keywords ***
Verify the user is switched to Child Window
    ${handles}=     Get Window Handles
    Switch Window    ${handles}[1]
    Sleep    5s
    ${actual_url}=   Get Location
    Should Be Equal As Strings  ${actual_url}   ${expected_child_url}
    [Return]      ${handles}

Grab the Email ID in the child Window
    ${email_id}=    Get Text    ${txt_email}
    Close Window
    [Return]    ${email_id}