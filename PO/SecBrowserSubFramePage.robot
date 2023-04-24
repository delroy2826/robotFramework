*** Settings ***
Documentation    FrameActions
Library     SeleniumLibrary
Library    String

*** Variables ***
${frame_selector}   //h5[contains(text(),'frametext')]//following-sibling::iframe
${frame2_selector}  //iframe[@id="frame2"]
${btn_click_frame}      //button[@id="Click"]

*** Keywords ***
Click on Frame and extract text
    [Arguments]    ${framename}
    ${frame_connector}=  Replace String    ${frame_selector}    frametext   ${framename}
    Select Frame    ${frame_connector}
    Click Button    ${btn_click_frame}
    Sleep    5
    ${extracted_text}=  Get Text    ${btn_click_frame}
    Log To Console    ${extracted_text}
    Unselect Frame

Click on Nested Frame and extract text
    [Arguments]    ${framename}
    ${frame_connector}=  Replace String    ${frame_selector}    frametext   ${framename}
    Select Frame    ${frame_connector}
    Select Frame    ${frame2_selector}
    Click Button    ${btn_click_frame}
    Sleep    5
    ${extracted_text}=  Get Text    ${btn_click_frame}
    Log To Console    ${extracted_text}
    Unselect Frame