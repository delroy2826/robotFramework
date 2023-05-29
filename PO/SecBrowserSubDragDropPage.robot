*** Settings ***
Documentation    WindowHandling
Library     SeleniumLibrary
Library    String

*** Variables ***
${draggable_locator}    //h4[text()='Draggable']//parent::div[@class="card"]//span[text()='Drag me around']
${drag_source}          //h4[text()='Droppable']//parent::div[@class="card"]//p[text()='Drag to target']
${drag_destination}     //h4[text()='Droppable']//parent::div[@class="card"]//p[text()='Drop here']
${drag_clm_name}    //h5[text()='Draggable Columns']//parent::div[@class="card"]//span[text()='Name']
${drag_clm_category}    //h5[text()='Draggable Columns']//parent::div[@class="card"]//span[text()='Category']
${drag_row_value_src}   //h5[text()='Draggable Rows']//parent::div[@class="card"]//td[text()='row_name_1']//parent::tr
${drag_row_value_des}   //h5[text()='Draggable Rows']//parent::div[@class="card"]//td[text()='row_name_2']//parent::tr
${sec_draggable_rows}   //h5[text()='Draggable Rows']
${range_slider}     //h4[text()='Range Slider']//parent::div[@class="card"]//div[contains(@class,'ui-slider')]//span[1]
${resize_image}     //h4[text()='Resize Image']//parent::div[@class="card"]//div[contains(@class,'ui-resizable')][1]

*** Keywords ***
Perform Drag by offset activity
    [Arguments]    ${x_axis}    ${y_axis}
    Drag And Drop By Offset    ${draggable_locator}     ${x_axis}    ${y_axis}
    Sleep    2

Perform Drag and Drop Activity
    Drag And Drop    ${drag_source}     ${drag_destination}
    Sleep    2

Perform Draggable Columns Activity
    Drag And Drop    ${drag_clm_name}   ${drag_clm_category}
    Sleep    2
    Drag And Drop By Offset    ${drag_clm_name}     350    0
    Sleep    2

Perform Draggable Rows Activity
    [Arguments]    ${row_name_1}    ${row_name_2}
    ${drag_row_value_src}=    Replace String    ${drag_row_value_src}   row_name_1     ${row_name_1}
    ${drag_row_value_des}=    Replace String    ${drag_row_value_des}   row_name_2    ${row_name_2}
    Drag And Drop   ${drag_row_value_src}   ${drag_row_value_des}
    Sleep    5
    Scroll Element Into View    ${sec_draggable_rows}
    Sleep    5
    Drag And Drop By Offset    ${drag_row_value_src}     0    15
    Sleep    5

Perform Range Slider Activity
    Drag And Drop By Offset    ${range_slider}     100    0
    Sleep    5

Perform Resize Image Activity
    Drag And Drop By Offset    ${resize_image}     300    0
    Sleep    5