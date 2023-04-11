*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The System specific keywords created from our own
...             Domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library     SeleniumLibrary

*** Variables ***
${input_username_field}     xpath://input[@name="username"]
${input_password_field}     id:password
${btn_sign_in}  xpath://input[@id="signInBtn"]
${Error_Message_Login}  xpath://div[contains(@class,'alert-danger')]
${Expected_Error_Message_Login}     Incorrect username/password.
${btn_login_okay_btn}   xpath://button[@id="okayBtn"]
${drop_down_login_page}     xpath://select[@class="form-control"]
${chk_bx_terms_and_condition}   xpath://label[@for="terms"]//span//input
${lnk_blinking_txt}     xpath://a[@class="blinkingText"]

*** Keywords ***
Fill the login form
    [Arguments]    ${username}  ${password}
    Input Text   ${input_username_field}    ${username}
    Input Password  ${input_password_field}   ${password}
    Click Button     ${btn_sign_in}

Verify error message is correct
    ${result} =  Get Text     ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   ${Expected_Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    ${Expected_Error_Message_Login}

Fill The Login Details and Select The User Option
    [Arguments]    ${username}  ${password}     ${radio_button}     ${drp_down_teach}
    Input Text   ${input_username_field}    ${username}
    Input Password  ${input_password_field}   ${password}
    Select Radio Button     radio   ${radio_button}
    Sleep    2s
    Wait Until Element Is Visible    ${btn_login_okay_btn}
    Click Element    ${btn_login_okay_btn}
    Select From List By Value    ${drop_down_login_page}  ${drp_down_teach}
    Select Checkbox     ${chk_bx_terms_and_condition}
    Sleep    3s
    Click Button     ${btn_sign_in}
    Sleep    3s

Select The link to Child Window
    Wait Until Element Is Visible   ${lnk_blinking_txt}
    Click Link    ${lnk_blinking_txt}

Switch to Parent window and enter the email
    [Arguments]    ${handles}   ${email_id}
    Switch Window    ${handles}[0]
    Input Text   ${input_username_field}    ${email_id}
    Sleep    5s

Wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}    10