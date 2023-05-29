*** Settings ***
Library     SeleniumLibrary
Library    String
Library    ../customlibraries/SeleniumAdvFunc.py

*** Variables ***
${disabled_btn}     //h5[text()='Confirm if the button is disabled.']//following-sibling::button
${loc_submit_btn}   //h5[text()='Find the position of the Submit button']//following-sibling::button
${col_save_btn}     //h5[text()='Find the Save button color']//following-sibling::button
${siz_sub_btn}      //h5[text()='Find the height and width of this button']//following-sibling::button
${col_chg_Success_btn}  //h5[text()='Mouse over and confirm the color changed']//following-sibling::button

*** Keywords ***
Verify if the button is disabled
    Element Should Be Disabled    ${disabled_btn}

Find the position of the Submit button
    ${coordinates}=     Get Location Element    ${loc_submit_btn}
    Log To Console    Location Coordinates are X : ${coordinates}[x] & Y : ${coordinates}[y]

Find the Save button color
    ${color_desc}=      Get Color Element Rgba   ${col_save_btn}
    Log To Console    Color Hex Code ${color_desc}

Find the height and width of this button
    ${size_value}=  Get Size Element   ${siz_sub_btn}
    Log To Console    Width : ${size_value}[width] & Height : ${size_value}[height]

Mouse over and confirm the color changed
    ${color_desc1}=      Get Color Element Rgba   ${col_chg_Success_btn}
    Log To Console    Color Hex Code ${color_desc1}
    Sleep    1
    Mouse Over    ${col_chg_Success_btn}
    Sleep    1
    ${color_desc2}=      Get Color Element Rgba   ${col_chg_Success_btn}
    Log To Console    Color Hex Code ${color_desc2}
    Sleep    2
    Should Not Be Equal As Strings     ${color_desc1}   ${color_desc2}