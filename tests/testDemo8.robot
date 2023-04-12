*** Settings ***
Documentation    This test file is for testing tags
Library    Collections

*** Variables ***
@{ROBOTS}=  Bender  Johnny5  Terminator  Robocop
${conditionTrue}    True
${conditionFalse}   False
${string1}  Cat
${string2}  Cat
${string3}  Dog
${number}   ${1}
@{list}   A   B   C
&{dictionary}   string=${string1}   number=${number}    list=@{list}
${COUNTER}=     0

*** Test Cases ***
Test Case 1
    [Tags]    SIMPLE
    Log To Console    This is test case 1

Test Case 2
    [Tags]    SIMPLE
    Log To Console    This is test case 2

Test Case 3
    [Tags]    SIMPLE
    Log To Console    This is test case 3

Test Case 4
    [Tags]    SIMPLE
    Log To Console    This is test case 4

Test Case 5
    [Tags]    SIMPLE
    Log To Console    This is test case 5

Test Case 6
    [Tags]    SIMPLE
    Log To Console    This is test case 6

Test Case 7
    [Tags]    SIMPLE
    Loop over a list of items and log each of them

Test Case 8
    [Tags]    SIMPLE
    # https://robocorp.com/docs/languages-and-frameworks/robot-framework/conditional-execution
    If condition is true and if condtion is false   ${conditionTrue}    ${conditionFalse}
    If condition for comparing two strings using equal operator  ${string1}  ${string2}
    If condition for comparing two strings using not equal to operator  ${string1}  ${string3}
    If condition using AND operator     ${string1}  ${string2}  ${string3}
    If condition for finding length of an string    ${string1}
    If condition with expression    ${string1}  ${string2}  ${string3}

Test Case 9
    [Tags]    SIMPLE
    If and Else condition construct
    If and Else if and else construct

Test Case 10
    [Tags]    SIMPLE
    ${dictionarydata}=  Creating Dictionary in robot framework
    validating if the key is present in the created dictionary  ${dictionarydata}
    print value from dictionarydata     ${dictionarydata}

Test Case 11
    [Tags]    SIMPLE
    Execute For Loop only Three Times
    Breaking out of For loop

Test Case 12
    [Tags]    SIMPLE
    Log To Console    ${number} @{list} &{dictionary}
    Log To Console    ${list}[2]
    Log To Console    ${dictionary}[string]

Test Case 13
    [Tags]    SIMPLE
    Loop A list
    Nested Loop List

Test Case 14
    [Tags]    SIMPLE
    Loop A Dictionary

Test Case 15
    [Tags]    SIMPLE
    While loop with default limit of 10000 iteration
    While loop when the default limit is hit
    Loop while condition evaluates to True
    Skip loop iteration with continue
    Break while loop

*** Keywords ***
Break while loop
    ${x}=   Set Variable    ${0}
    WHILE    ${x}<10
        ${x}=   Evaluate    ${x}+1
        IF  ${x}==5
            BREAK
        END
        Log To Console    ${x} is the value
    END

Skip loop iteration with continue
    ${x}=   Set Variable    ${0}
    WHILE    ${x}<10
        ${x}=   Evaluate    ${x}+1
        IF  ${x}==5
            CONTINUE
        END
        Log To Console    ${x} is the value
    END

Loop while condition evaluates to True
    ${x}=   Set Variable    ${0}
    WHILE    ${x}<10
        Log To Console    ${x} is the value
        ${x}=   Evaluate    ${x}+1
    END

While loop when the default limit is hit
    TRY
        WHILE    True   limit=10
            ${COUNTER}=     EVALUATE   ${COUNTER}+1
            Log To Console     ${COUNTER}
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log To Console    The loop did not finish within the limit
    END

While loop with default limit of 10000 iteration
    TRY
        WHILE    True   limit=9999
            ${COUNTER}=     EVALUATE   ${COUNTER}+1
            Log To Console     ${COUNTER}
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log To Console    The loop aborted
    END

Loop A Dictionary
    FOR     ${dict_tuple}   IN      &{dictionary}
        Log To Console    ${dict_tuple}
    END
    FOR     ${key}   IN      @{dictionary}
        Log To Console    ${key}=${dictionary}[${key}]
    END

Nested Loop List
    @{alphabet}=    Create List    A    B   C   D   E   F
    Log To Console    ${alphabet}
    @{numbers}=     Create List    ${1}    ${2}   ${3}   ${4}   ${5}
    Log To Console    ${numbers}
    FOR     ${item1}    IN      @{numbers}
        FOR     ${item2}    IN RANGE    ${item1}
            Log To Console    ${alphabet}[${item1}]
        END
    END

Loop A list
    Log To Console    ${list}
    FOR     ${item}     IN  @{list}
        Log To Console    ${item}
    END
    FOR     ${item}     IN  1   2   3   4
        Log To Console    ${item}
    END
    FOR     ${i}    IN RANGE    10
        Log To Console    ${i}
    END
    FOR     ${i}    IN RANGE    len(@{list})
        Log To Console    ${list}[${i}]
    END
    FOR     ${i}    IN RANGE    0   10  2
        Log To Console    ${i}
    END
Breaking out of For loop
    FOR     ${value}    IN  @{ROBOTS}
        IF  $value == 'Johnny5'
            BREAK
        END
        Log To Console    ${value}
    END

Execute For Loop only Three Times
    FOR     ${value}    IN      @{ROBOTS}
        IF  $value == "Robocop"
            CONTINUE
        END
        Log To Console    ${value}
    END

Loop over a list of items and log each of them
    FOR     ${value}    IN      @{ROBOTS}
        Log To Console    ${value}
    END

If condition is true and if condtion is false
    [Arguments]    ${conditionTrue}    ${conditionFalse}
    IF  ${conditionTrue}
        Log To Console    This line is executed
    END
    IF  ${conditionFalse}
        Log To Console    This line is not executed
    END

If condition for comparing two strings using equal operator
    [Arguments]    ${string1}  ${string2}
    IF  "${string1}" == "${string2}"
        Log To Console     ${string1} is equal to ${string2}
    END
    IF  1 == 1
        Log To Console    This line is executed 1 Equal to 1
    END

If condition for comparing two strings using not equal to operator
    [Arguments]    ${string1}  ${string3}
    IF  "${string1}" != "${string3}"
        Log To Console  ${string1} is not equal to ${string3}
    END

If condition using AND operator
    [Arguments]    ${string1}  ${string2}   ${string3}
    IF  "${string1}" == "${string2}" and "${string1}" != "${string3}"
        Log To Console    ${string1} is equal to ${string2} and ${string1} is not equal to ${string3}
    END
    IF  "${string1}" == "${string2}" and "${string1}" == "${string3}"
        Log To Console    This line is not executed
    END

If condition for finding length of an string
    [Arguments]    ${string1}
    ${len_string}=     Get Length    ${string1}
    IF  len("${string1}") == 3
        Log To Console    Length of String is ${len_string}
    END

If condition with expression
    [Arguments]    ${string1}  ${string2}   ${string3}
    IF  ("${string1}" == "${string2}" and 1 == 1) and "${string1}" != "${string3}"
        Log To Console    ${string1} is equal to ${string2} and ${string1} is not equal to ${string3}
    END

If and Else condition construct
    IF  1 == 1
        Log To Console    if block is executed
    ELSE
        Log To Console    else block is not executed
    END
    IF  1 == 2
        Log To Console    if block is not executed
    ELSE
        Log To Console    else block is not executed
    END

If and Else if and else construct
    IF  1 == 2
        Log To Console    if block is not executed
    ELSE IF    1 == 1
        Log To Console    Else if block is executed
    ELSE
        Log To Console    else block is not executed
    END

Creating Dictionary in robot framework
    &{dictionary_data}=     Create Dictionary    A=APPLE    B=BALL  C=CAT   D=DOG
    Log To Console    ${dictionary_data}
    [Return]    ${dictionary_data}

validating if the key is present in the created dictionary
    [Arguments]    ${dictionary_data}
    Dictionary Should Contain Key    ${dictionary_data}     C

print value from dictionarydata
    [Arguments]    ${dictionary_data}
    Log To Console    ${dictionary_data}[A]
    ${value}=   Get From Dictionary    ${dictionary_data}   B
    Log To Console    ${value}
    Dictionary Should Not Contain Key   ${dictionary_data}     E
