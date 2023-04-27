*** Settings ***
Documentation    Alert Actions
Library    SeleniumLibrary
Library    String
*** Variables ***
${dialog_button}    //h5[normalize-space(text())='alertboxtitle']//following-sibling::button
${diaglog_succ_msg}     //h5[normalize-space(text())='Alert (Prompt Dialog)']//following-sibling::span[@id="simple_result" or @id="result" or @id="confirm_result"]
${sweet_dialog_msg}     //div[@role='dialog']//p[normalize-space(text())='You have clicked and open a dialog that can be inspectable.']
${btn_dialog_dismiss}   //div[@role='dialog']//button//span[text()='Dismiss']
${sweet_modal_dialog_msg}   //div[@role='dialog']//p[normalize-space(text())='Unless you close this, you cannot interact with other element. But am inspectable !']
${btn_click_dialog_close}   //div[@role="dialog"]//span[text()="Modal Dialog (Sweet Alert)"]//following-sibling::a[@role="button"]

*** Keywords ***
Perform Click on Alert Box
    [Arguments]    ${alertname}
    ${alert_element_btn}=   Replace String    ${dialog_button}  alertboxtitle   ${alertname}
    Click Button        ${alert_element_btn}
    Sleep    3

Handle Alert Simple Dialog
    ${alert_message} =  Handle Alert    action=ACCEPT
    Sleep    3
    [Return]    ${alert_message}

Get Message After Clicking on Alert
    [Arguments]    ${alertname}
    ${alert_element_btn}=   Replace String    ${diaglog_succ_msg}  alertboxtitle   ${alertname}
    ${success_msg}=     Get Text    ${alert_element_btn}
    [Return]    ${success_msg}

Handle Alert (Confirm Dialog) For Ok
    ${alert_message} =  Handle Alert    action=ACCEPT
    Sleep    3
    [Return]    ${alert_message}

Handle Alert (Confirm Dialog) For Cancle
    ${alert_message} =  Handle Alert    action=DISMISS
    Sleep    3
    [Return]    ${alert_message}

Handle Sweet Alert (Simple Dialog) For Ok
    Element Should Be Visible   ${sweet_dialog_msg}     message=Message is not displayed as expected
    Click Element    ${btn_dialog_dismiss}

Handle Sweet Modal Dialog For Ok
    Element Should Be Visible   ${sweet_modal_dialog_msg}     message=Message is not displayed as expected
    Click Element    ${btn_click_dialog_close}

Handle Alert (Prompt Dialog) Input text for Ok
    [Arguments]    ${textpassed}
    ${alert_message} =  Input Text Into Alert    ${textpassed}  action=ACCEPT
    Sleep    3
    [Return]    ${alert_message}

Handle Alert (Prompt Dialog) For Cancle
    ${alert_message} =  Handle Alert    action=DISMISS
    Sleep    3
    [Return]    ${alert_message}