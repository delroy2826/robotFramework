*** Settings ***
Library     SeleniumLibrary
Library    String

*** Variables ***
${name_input_field}     //h5[text()='Type your name']//following-sibling::div//input[@placeholder="Babu Manickam"]
${name_append_input_field}      (//h5[text()='Append Country to this City.']//following-sibling::div//input)[1]
${disabled_text_box}    (//h5[text()='Verify if text box is disabled']//following-sibling::div//input)[1]
${clr_input_field}      (//h5[text()='Clear the typed text.']//following-sibling::div//input)[1]
${extract_text_input_field}     (//h5[text()='Retrieve the typed text.']//following-sibling::div//input)[1]
${email_address_field}      (//h5[text()='Type email and Tab. Confirm control moved to next element.']//following-sibling::div//input)[1]
${conf_err_msg_field}   (//h5[text()='Just Press Enter and confirm error message*']//following-sibling::div//input)[1]
${age_err_msg}      //span[text()='Age is mandatory']

*** Keywords ***
Enter name in the Type your name field
    [Arguments]    ${name_text}
    Input Text    ${name_input_field}   ${name_text}

Append text in the input field
    [Arguments]     ${name_text}
    ${extracted_text}=      Get Element Attribute    ${name_append_input_field}     value
    Log To Console    ${extracted_text}**********
    ${input_txt}=   Catenate     ${extracted_text}  ${name_text}
    Input Text    ${name_append_input_field}    ${input_txt}

Check if the text box is disabled
    Element Should Be Disabled    ${disabled_text_box}

Clear the input field and enter text
    [Arguments]    ${name_text}
    Clear Element Text       ${clr_input_field}
    Input Text     ${clr_input_field}   ${name_text}

Extract text from field
    ${extracted_text}=      Get Element Attribute    ${extract_text_input_field}    value
    Log To Console    ${extracted_text}

Enter email address Press tab and enter tell me about yourself
    [Arguments]    ${email_id}  ${paragraph}
    Input Text    ${email_address_field}    ${email_id}
    Press Keys  None    TAB
    Press Keys    None  ${paragraph}

Press Enter on the input field and verify error msg is displayed
    Click Element    ${conf_err_msg_field}
    Press Keys    None  ENTER
    Element Should Be Visible    ${age_err_msg}
