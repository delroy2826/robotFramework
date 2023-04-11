*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The System specific keywords created from our own
...             Domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library     SeleniumLibrary
Library    String

*** Variables ***
${tbl_product}      xpath://tr//th[text()='Product']
${product_name}     xpath://h4[@class="media-heading"]//a[text()='productname']
${btn_checkoutpage}     xpath://button[contains(text(),'Checkout')]
${txt_country_input}  xpath://input[@id="country"]
${txt_country}  xpath://div[@class="suggestions"]//a[text()='country']
${btn_purchase}     xpath://input[@value="Purchase"]
${txt_success_alert}    xpath://div[contains(@class,'alert')]//strong[text()='Success!']

*** Keywords ***
Validate Expected Product Displayed in Checkout Page
    [Arguments]    ${product_list}
    FOR  ${product}  IN     @{product_list}
        ${product_name}=    Replace String    ${product_name}   productname     ${product}
         Element Should Be Visible    ${product_name}
    END

Select Country and Proceed To Purchase
    [Arguments]    ${country_name}
    Input Text    ${txt_country_input}    ${country_name}
    ${txt_country}=     Replace String    ${txt_country}    country     ${country_name}
    Wait Until Element Is Visible      ${txt_country}   10
    Click Element    ${txt_country}
    Click Element    ${btn_purchase}


