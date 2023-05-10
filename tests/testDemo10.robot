*** Settings ***
Documentation    Perform Test on Dashboard
Resource    ../PO/Generic.robot
Resource    ../PO/DashboardPage.robot
Resource    ../PO/SecBrowserSubFramePage.robot
Resource    ../PO/SecBrowserSubAlertPage.robot
Resource    ../PO/SecBrowserSubWindowPage.robot
Resource    ../PO/secBrowserSubDragDropPage.robot
Test Setup    Open Browser With passed Url    ${URL_Param}
Test Teardown   close browser session
Library    String

*** Variables ***
${URL_Param}    https://leafground.com/dashboard.xhtml

*** Test Cases ***
Select Weekly Tasks
    [Tags]    DASHBOARD    ALL
    Select Weekly checkbox from Weekly tasks table

Get Inventory ID Data from table Inventory by Status InStock or Lowstock
    [Tags]    DASHBOARD    ALL
    Get Inventory text

Frame Actions
    [Tags]    FRAME    ALL
    Navigate to     Browser     Frame
    Click on Frame and extract text     Click Me (Inside frame)
    Click on Nested Frame and extract text     Click Me (Inside Nested frame)

Alert Handling Alert ( Simple Dialog )
    [Tags]    ALERT    ALL
    Navigate to     Browser     Alert
    Perform Click on Alert Box    Alert (Simple Dialog)
    ${message} =  Handle Alert Simple Dialog
    Log To Console    ${message} - Message Displayed
    ${message} =    Get Message After Clicking on Alert     Alert (Simple Dialog)
    Log To Console    ${message} - Success Message

Alert Handling Alert (Confirm Dialog)
    [Tags]    ALERT    ALL
    Navigate to     Browser     Alert
    Perform Click on Alert Box    Alert (Confirm Dialog)
    ${message} =  Handle Alert (Confirm Dialog) For Ok
    Log To Console    ${message} - Message Displayed
    ${message} =    Get Message After Clicking on Alert     Alert (Confirm Dialog)
    Log To Console    ${message} - Success Message

    Perform Click on Alert Box    Alert (Confirm Dialog)

    ${message} =  Handle Alert (Confirm Dialog) For Cancle
    Log To Console    ${message} - Message Displayed
    ${message} =    Get Message After Clicking on Alert     Alert (Confirm Dialog)
    Log To Console    ${message} - Cancle Success Message

Alert Handling Sweet Alert (Simple Dialog)
    [Tags]    ALERT    ALL
    Navigate to     Browser     Alert
    Perform Click on Alert Box    Sweet Alert (Simple Dialog)
    Handle Sweet Alert (Simple Dialog) For Ok

Alert Handling Sweet Modal Dialog
    [Tags]    ALERT    ALL
    Navigate to     Browser     Alert
    Perform Click on Alert Box    Sweet Modal Dialog
    Handle Sweet Modal Dialog For Ok

Alert Handling Alert (Prompt Dialog)
    [Tags]    ALERT    ALL
    Navigate to     Browser     Alert
    Perform Click on Alert Box    Alert (Prompt Dialog)
    ${message} =    Handle Alert (Prompt Dialog) Input text for Ok  Delroy
    Log To Console    ${message} - Message Displayed
    ${message} =    Get Message After Clicking on Alert     Alert (Prompt Dialog)
    Log To Console    ${message} - Success Message

    Perform Click on Alert Box    Alert (Prompt Dialog)

    ${message} =  Handle Alert (Prompt Dialog) For Cancle
    Log To Console    ${message} - Message Displayed
    ${message} =    Get Message After Clicking on Alert     Alert (Prompt Dialog)
    Log To Console    ${message} - Cancle Success Message

Handle Click and Confirm new Window Opens
    [Tags]    WINDOW_HANDLE    ALL
    Navigate to     Browser     Window
    ${handles}=     Perform Click and Confirm new Window Opens  https://leafground.com/dashboard.xhtml
    Verify control is back to parent Window     ${handles}      https://leafground.com/window.xhtml

Handle Find the number of opened tabs
    [Tags]    WINDOW_HANDLE    ALL
    Navigate to     Browser     Window
    ${handles}=     Perform Find the number of opened tabs  https://leafground.com/table.xhtml
    Verify control is back to parent Window     ${handles}      https://leafground.com/window.xhtml

Handle Close all windows except Primary
    [Tags]    WINDOW_HANDLE    ALL
    Navigate to     Browser     Window
    ${handles}=     Perform Close all windows except Primary  https://leafground.com/alert.xhtml
    Verify control is back to parent Window     ${handles}      https://leafground.com/window.xhtml

Handle Wait for 2 new tabs to open
    [Tags]    WINDOW_HANDLE    ALL
    Navigate to     Browser     Window
    ${handles}=     Perform Wait for 2 new tabs to open
    Verify control is back to parent Window     ${handles}      https://leafground.com/window.xhtml