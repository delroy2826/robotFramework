*** Settings ***
Documentation    Dashboard Actions
Library     SeleniumLibrary
Library    String

*** Variables ***
${tbl_weekly_tasks}     //span[contains(@class,'title') and text()='Weekly Tasks']//parent::div//parent::div//div[contains(@id,'content')]//div[contains(@class,'select')]//following-sibling::span
${tbl_value}    //span[contains(@class,'title') and text()='Weekly Tasks']//parent::div//parent::div//div[contains(@id,'content')]//div[contains(@class,'select')]//following-sibling::span[text()='tabledata']//preceding-sibling::div//div[contains(@class,'chkbox')]
${inventory_id}     //span[text()='INSTOCK']//parent::td//preceding-sibling::td[3]


*** Keywords ***
Select Weekly checkbox from Weekly tasks table
    ${actual_list}=     Get Webelements    ${tbl_weekly_tasks}
    FOR    ${element}   IN      @{actual_list}
        IF  "Weekly" in "${element.text}"
            ${tbl_value_updated}=   Replace String    ${tbl_value}    tabledata     ${element.text}
            Click Element    ${tbl_value_updated}
            Sleep    3
        END
    END

Get Inventory text
    ${actual_invertory_list}=   Get Webelements    ${inventory_id}
    FOR    ${element}   IN      @{actual_invertory_list}
        Log To Console    ${element.text}
    END