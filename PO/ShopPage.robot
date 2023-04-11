*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The System specific keywords created from our own
...             Domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library     SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
${Checkout_btn}     xpath://a[contains(text(),'Checkout')]
${card_titles}      xpath://h4[@class="card-title"]//a
${add_buttons_index}    xpath:(//button[contains(text(),'Add')])[number]
${lbl_category_list}    xpath://a[@class="list-group-item"]

*** Keywords ***
Verify card titles in the Shop Page
    [Arguments]    ${expected_list}
    ${actual_list} =  Get Webelements    ${card_titles}
    @{actual_product_list} =    Create List
    FOR     ${element}      IN      @{actual_list}
        Append To List  ${actual_product_list}   ${element.text}
    END
    Log To Console    ${actual_product_list}
    Lists Should Be Equal   ${expected_list}    ${actual_product_list}

Select the card
    [Arguments]     ${cardname}
    ${actual_list} =  Get Webelements    ${card_titles}
    ${index_number} =   Set Variable    1
    FOR     ${element}  IN  @{actual_list}
        Exit For Loop If   '${cardname}' =='${element.text}'
        ${index_number}=   Evaluate    ${index_number}+1
    END
    ${index_number}=    Convert To String   ${index_number}
    ${add_buttons_index}=   Replace String    ${add_buttons_index}  number  ${index_number}
    Click Button    ${add_buttons_index}
    Sleep    5s

Verify Category List
    [Arguments]     ${expected_category_list}
    ${actual_catelist} =  Get Webelements    ${lbl_category_list}
    @{actual_category_list} =    Create List
    FOR     ${element}      IN      @{actual_catelist}
        Append To List  ${actual_category_list}   ${element.text}
    END
    Lists Should Be Equal   ${expected_category_list}    ${actual_category_list}