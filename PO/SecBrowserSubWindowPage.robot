*** Settings ***
Documentation    WindowHandling
Library     SeleniumLibrary
*** Variables ***
${btn_clk_opn_conf}     //h5[text()="Click and Confirm new Window Opens"]//following-sibling::button//span
${btn_clk_opn_tab}      //h5[text()="Find the number of opened tabs"]//following-sibling::button//span
${btn_clk_close_win}    //h5[text()="Close all windows except Primary"]//following-sibling::button//span[2]
${btn_opn_with_delay}   //h5[text()="Wait for 2 new tabs to open"]//following-sibling::button//span

*** Keywords ***
Perform Click and Confirm new Window Opens
    [Arguments]    ${expected_child_url}
    Click Element    ${btn_clk_opn_conf}
    ${handles}=     Get Window Handles
    Switch Window    ${handles}[1]
    ${actual_url}=   Get Location
    Should Be Equal As Strings  ${actual_url}   ${expected_child_url}
    [Return]      ${handles}

Verify control is back to parent Window
    [Arguments]    ${window_handle_address}     ${expected_parent_url}
    Switch Window    ${window_handle_address}[0]
    ${actual_url}=   Get Location
    Should Contain    ${actual_url}     ${expected_parent_url}

Perform Find the number of opened tabs
    [Arguments]    ${expected_child_url}
    Click Element    ${btn_clk_opn_tab}
    ${handles}=     Get Window Handles
    ${count}=   Get Length  ${handles}
    Should Be Equal As Numbers     ${count}     3
    Switch Window    ${handles}[2]
    ${actual_url}=   Get Location
    Should Be Equal As Strings  ${actual_url}   ${expected_child_url}
    [Return]      ${handles}

Perform Close all windows except Primary
    [Arguments]    ${expected_child_url}
    Click Element    ${btn_clk_close_win}
    Sleep    10
    ${handles}=     Get Window Handles
    ${count}=   Get Length  ${handles}
    Should Be Equal As Numbers     ${count}     4
    Switch Window    ${handles}[3]
    ${actual_url}=   Get Location
    Should Be Equal As Strings  ${actual_url}   ${expected_child_url}
    Close Window
    Switch Window    ${handles}[2]
    ${actual_url}=   Get Location
    Close Window
    [Return]      ${handles}

Perform Wait for 2 new tabs to open
    Click Element    ${btn_opn_with_delay}
    Sleep    10
    ${handles}=     Get Window Handles
    ${count}=   Get Length  ${handles}
    Log To Console    ${count} Windows opened
    Switch Window    ${handles}[2]
    Close Window
    Sleep    2
    Switch Window    ${handles}[1]
    Close Window
    Sleep    2
    [Return]      ${handles}



