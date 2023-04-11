*** Settings ***
Documentation    This test file is for testing tags
Library    Collections
Library    RequestsLibrary
Library    Collections
Library    ../customlibraries/APIHelperMethod.py

*** Variables ***
${BASE_URL}     https://rahulshettyacademy.com/
${AUTHOR_NAME}  john FoeDell
${book_id}      bcd5511223


*** Test Cases ***
Test Case 1
    &{datajson}=    Create Dictionary    name=Learn Appium Automation with Java     isbn=bcd    aisle=5511223   author=${AUTHOR_NAME}
    ${response}=    POST    ${BASE_URL}Library/Addbook.php  json=${datajson}    expected_status=200
    Log To Console    ${response.json()}
    ${book_id}=     Get From Dictionary    ${response.json()}   ID
    Set Global Variable    ${book_id}
    Log To Console    The book id is ${book_id}
    Should Be Equal As Strings  ${response.json()}[Msg]     successfully added

Test Case 2
    ${response}=    GET    url=${BASE_URL}Library/GetBook.php?AuthorName=${AUTHOR_NAME}
    Log To Console    ${response.json()}
    ${dict_data_values}=    Get Dictionary Key Value       ${response.json()}   ${book_id}
    Log To Console    ${dict_data_values}[book_name]

Test Case 3
    ${response}=    GET    ${BASE_URL}Library/GetBook.php  params=ID=${book_id}
    Log To Console    ${response.json()}
    Should Be Equal As Strings  Learn Appium Automation with Java   ${response.json()}[0][book_name]

Test Case 4
    &{payload}=     Create Dictionary    id=${book_id}
    ${response}=    POST    ${BASE_URL}Library/DeleteBook.php  json=${payload}    expected_status=200
    Log To Console    ${response.json()}

*** Keywords ***