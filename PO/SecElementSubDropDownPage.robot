*** Settings ***
Documentation    Alert Actions
Library    SeleniumLibrary
Library    String
Library    ../customlibraries/CommonHelperFunction.py


*** Variables ***
${select_country}   //li[text()='countryname']
${lst_city}     //li[text()='cityname']
${input_choose_course}     //h5[text()='Choose the Course']//following-sibling::div//input[@placeholder='Choose Course']
${lbl_choose_course}    //li[@data-item-label="coursename"]
${btn_slt_lang}     //h5[text()='Choose language randomly']//following::label[text()='Select Language']//following-sibling::div[contains(@class,'trigger')]
${lst_lang_opt}     //li[@data-label="languageopt"]
${btn_slt_values}   //h5[contains(text(),'language chosen')]//following::label[text()='Select Values']//following-sibling::div[contains(@class,'trigger')]
${btn_slt_lang_num}     //li[@data-label="languageoptnum"]

*** Keywords ***
Verify if all expected options are displayed
    [Arguments]    ${actual}    ${expected}
#    FOR     ${item}     IN  @{expected}
#        Log To Console    ${item}
#        IF  "${item}" in "${actual}"
#            Log To Console    ${item} is present in @{expected}
#        ELSE
#            Log To Console    ${item} is not present in @{expected}
#        END
#    END
    FOR     ${item}     IN  @{expected}
        Should Contain    ${actual}     ${item}     msg=${item} is not present in ${expected}
    END

Verify if Expected Cities loaded
    [Arguments]    ${locator}   ${expected}
    Click Element    ${locator}
    Sleep    2
    FOR    ${item}  IN  @{expected}
        ${city_value}=  Replace String    ${lst_city}   cityname    ${item}
        Element Should Be Visible   ${city_value}
    END

Select The Country From The Drop Down
    [Arguments]    ${locator}   ${country}
    Click Element    ${locator}
    ${slt_country}=     Replace String    ${select_country}     countryname     ${country}
    Click Element    ${slt_country}

Enter the course name and select the course
    [Arguments]    ${input}     ${coursename}
    Input Text    ${input_choose_course}   ${input}
    Sleep    4
    ${lbl_choose_course}=      Replace String    ${lbl_choose_course}   coursename  ${coursename}
    Click Element    ${lbl_choose_course}

Choose Langauge and number random
    [Arguments]    ${dict_data}
    Sleep    5
    Log To Console    ${dict_data}
    ${lang_data}=   Get Random Key Value From Dict    ${dict_data}
    Log To Console    ${lang_data}[0]
    Log To Console  ${lang_data}[1]
    Click Element    ${btn_slt_lang}
    ${lst_lang_opt}=    Replace String    ${lst_lang_opt}   languageopt  ${lang_data}[0]
    Click Element    ${lst_lang_opt}
    Sleep    2
    Click Element    ${btn_slt_values}
    ${btn_slt_lang_num}=    Replace String    ${btn_slt_lang_num}   languageoptnum  ${lang_data}[1]
    Click Element    ${btn_slt_lang_num}
    Sleep    4







