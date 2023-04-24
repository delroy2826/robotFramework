*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The System specific keywords created from our own
...             Domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library     SeleniumLibrary
Library    String

*** Variables ***
${URL}  https://rahulshettyacademy.com/loginpagePractise/
${username}     rahulshettyacademy
${invalid_pw}   rahulshettyacademy
${password}     learning
${radio_btnuser}    user
${drp_down_teach}   teach
${browser_name}     Chrome
${navigation_element}   //span[text()='navigation_title']//preceding-sibling::i
${navigation_opt}       //span[text()='navigation_opt']//parent::a

*** Keywords ***
open the browser with the mortage payment URL
    Create Webdriver    Chrome  executable_path=driver/chromedriver.exe
    Maximize Browser Window
    Go To   ${URL}

open browser with with defined browser
    Create Webdriver    ${browser_name}  executable_path=driver/${browser_name}.exe
    Maximize Browser Window
    Go To   ${URL}

Wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible   ${element}    10

close browser session
    Close Browser

Open Browser with passed url
    [Arguments]    ${URL_Param}
    Create Webdriver    Chrome  executable_path=driver/chromedriver.exe
    Maximize Browser Window
    Go To   ${URL_Param}
    Sleep    5

Navigate to
    [Arguments]    ${navigation_title}  ${navigation_option}
    ${nav_main}=    Replace String    ${navigation_element}     navigation_title    ${navigation_title}
    Click Element    ${nav_main}
    Sleep    5
    ${nav_option}=    Replace String    ${navigation_opt}     navigation_opt    ${navigation_option}
    Click Link    ${nav_option}
    Sleep    5