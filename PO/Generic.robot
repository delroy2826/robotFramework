*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The System specific keywords created from our own
...             Domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library     SeleniumLibrary

*** Variables ***
${URL}  https://rahulshettyacademy.com/loginpagePractise/
${username}     rahulshettyacademy
${invalid_pw}   rahulshettyacademy
${password}     learning
${radio_btnuser}    user
${drp_down_teach}   teach
${browser_name}     Chrome

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