*** Settings ***
Documentation    Perform Test on Dashboard
Resource    ../PO/Generic.robot
Resource    ../PO/DashboardPage.robot
Resource    ../PO/SecBrowserSubFramePage.robot
Test Setup    Open Browser With passed Url    ${URL_Param}
Test Teardown   close browser session
Library    String

*** Variables ***
${URL_Param}    https://leafground.com/dashboard.xhtml

*** Test Cases ***
Select Weekly Tasks
    Select Weekly checkbox from Weekly tasks table

Get Inventory ID Data from table Inventory by Status InStock or Lowstock
    Get Inventory text

Frame Actions
    Navigate to     Browser     Frame
    Click on Frame and extract text     Click Me (Inside frame)
    Click on Nested Frame and extract text     Click Me (Inside Nested frame)
