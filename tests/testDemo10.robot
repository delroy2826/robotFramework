*** Settings ***
Documentation    Perform Test on Dashboard
Resource    ../PO/Generic.robot
Resource    ../PO/DashboardPage.robot
Resource    ../PO/SecBrowserSubFramePage.robot
Resource    ../PO/SecBrowserSubAlertPage.robot
Resource    ../PO/SecBrowserSubWindowPage.robot
Resource    ../PO/SecBrowserSubDragDropPage.robot
Resource    ../PO/SecElementSubTextBoxPage.robot
Resource    ../PO/SecElementSubButtonPage.robot
Resource    ../PO/SecElementSubDropDownPage.robot
Test Setup    Open Browser With passed Url    ${URL_Param}
Test Teardown   close browser session
Library    String

*** Variables ***
${URL_Param}    https://leafground.com/dashboard.xhtml
${drp_down_ui_auto}     //h5[contains(text(),'UI Automation tool')]//parent::div[@class='card']//select[@class='ui-selectonemenu']
@{expected_tool_opt_lst}    Select Tool  Selenium    Playwright  Puppeteer   Cypress
${input_dwn_pref_country}     //h5[contains(text(),'preferred country')]//parent::div[@class='card']//label[text()='Select Country']
${input_dwn_city}     //h5[contains(text(),'Confirm Cities')]//parent::div[@class='card']//label[text()='Select City']
@{expected_city_opt_lst}    Select City     Berlin  Frankfurt   Munich
@{list_of_num_en}   One     Two     Three
@{list_of_num_kn}   ಎರಡು    ಒಂದು    ಮೂರು
&{lang_dict}    English=@{list_of_num_en}   Kannada=@{list_of_num_kn}

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

Perform Draggable Activity using Drag by offset
    [Tags]    DRAGANDDROP    ALL
    Navigate To    Browser      Drag
    Perform Drag by offset activity     200     0

Perform Droppable Activity using Drag and Drop
    [Tags]    DRAGANDDROP    ALL
    Navigate To    Browser      Drag
    Perform Drag and Drop Activity

Perform Draggable Columns Activity using Drag and Drop
    [Tags]    DRAGANDDROP    ALL
    Navigate To    Browser      Drag
    Perform Draggable Columns Activity

Perform Draggable Rows Activity using Drag and Drop
    [Tags]    DRAGANDDROP    ALL
    Navigate To    Browser      Drag
    Perform Draggable Rows Activity     Bamboo Watch    Blue Band

Perform Range Slider Activity using Drag by offset
    [Tags]    DRAGANDDROP    ALL
    Navigate To    Browser      Drag
    Perform Range Slider Activity

Perform Resize Image Activity using Drag by offset
    [Tags]    DRAGANDDROP    ALL
    Navigate To    Browser      Drag
    Perform Resize Image Activity

Perform Input Operation on text box
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Enter name in the Type your name field      Delroy
    Sleep    2

Perform Append Country to this City on input field
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Append text in the input field      Delroy
    Sleep    2

Verify Text box is disabled
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Check if the text box is disabled
    Sleep    2

Perform clear field operation on Input field
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Clear the input field and enter text    Field Cleared
    Sleep    2

Perform extraction of text from input field
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Extract text from field
    Sleep    2

Perform Keyboard action on an input field
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Enter email address Press tab and enter tell me about yourself      delroyoliveira@gmail.com    I am Automation Tester
    Sleep    2

Perform Enter Activity on the input field
    [Tags]    TEXTBOX   ALL
    Navigate To    Element      Text Box
    Press Enter on the input field and verify error msg is displayed
    Sleep    5

Verify if the button is disabled
    [Tags]    BUTTON    ALL
    Navigate To    Element      Button
    Verify if the button is disabled
    Sleep    2

Extract location of the submit button
    [Tags]    BUTTON    ALL
    Navigate To    Element      Button
    Find the position of the Submit button
    Sleep    2

Extract Color of the save button
    [Tags]    BUTTON    ALL
    Navigate To    Element      Button
    Find the Save button color
    Sleep    2

Get height and Width of the element
    [Tags]    BUTTON    ALL
    Navigate To    Element      Button
    Find the height and width of this button
    Sleep    2

Verify if color change while mouse hover on the element
    [Tags]    BUTTON    ALL
    Navigate To    Element      Button
    Mouse over and confirm the color changed
    Sleep    2

Verify drop down selection on UI Automation Tool
    [Tags]    DROP_DOWN     ALL
    Navigate To     Element     Dropdown
    ${actual_opt_lst}=   Get all values of the selected list     ${drp_down_ui_auto}
    Log To Console    ${actual_opt_lst}
    Verify if all expected options are displayed    ${actual_opt_lst}   ${expected_tool_opt_lst}
    Select the value from the drop down     ${drp_down_ui_auto}     Selenium
    ${expected_opt}=    Verify expected option selected     ${drp_down_ui_auto}
    Log To Console    ${expected_opt}
    Should Be Equal    ${expected_opt}  Selenium
    Sleep   2

Verify Cities belonging to prefered country is loaded
    [Tags]    DROP_DOWN     ALL
    Navigate To     Element     Dropdown
    Sleep   2
    Select The Country From The Drop Down    ${input_dwn_pref_country}  Germany
    Sleep   2
    Verify if Expected Cities loaded    ${input_dwn_city}   ${expected_city_opt_lst}
    Sleep   2

Verify course is choosed fromt the suggestions
    [Tags]    DROP_DOWN     ALL
    Navigate To     Element     Dropdown
    Sleep   2
    Enter the course name and select the course     sele    Selenium WebDriver
    Sleep    5

Verify Selection of langague and number system
    [Tags]    DROP_DOWN     ALL
    Navigate To     Element     Dropdown
    Sleep   2
    Choose Langauge and number random   ${lang_dict}