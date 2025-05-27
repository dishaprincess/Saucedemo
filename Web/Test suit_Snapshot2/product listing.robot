*** Settings ***
Resource   ../CommonKeywords.robot    # Adjust path as needed
*** Test Cases ***
Clicking Humberger icon
    Login To Application
    Sleep    10s
    Click Hamburger icon
    Sleep       10s
    Close Browser

Clciking on all Items
    Login To Application
    Sleep    10s
    Click Hamburger icon
    Sleep       10s
    Click Element       Xpath=//a[text()='All Items']
    Sleep   10s
    Close Browser

Product listing loads
    Login To Application
    Sleep    5s
    Click Hamburger icon
    Wait Until Element Is Visible    xpath=//*[text()='All Items']    timeout=10s
    Click Element       xpath=//*[text()='All Items']
    Sleep   5s
    ${title}=  Get Text    xpath=//div[text()='Sauce Labs Backpack']
    ${title1}=  Get Text    xpath=//div[text()='Sauce Labs Bike Light']
    ${title2}=  Get Text    xpath=//div[text()='Sauce Labs Bolt T-Shirt']
    ${title3}=  Get Text    xpath=//div[text()='Sauce Labs Fleece Jacket']
    ${title4}=  Get Text    xpath=//div[text()='Sauce Labs Onesie']
    ${title5}=  Get Text    xpath=//div[text()='Test.allTheThings() T-Shirt (Red)']
    @{all_titles}=    Create List    ${title}    ${title1}    ${title2}    ${title3}    ${title4}    ${title5}
    @{Product}=       Create List    Sauce Labs Backpack    Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt  Sauce Labs Fleece Jacket   Sauce Labs Onesie       Test.allTheThings() T-Shirt (Red)
    Lists Should Be Equal    ${all_titles}     ${Product}

Understanding variable
    ${title}=  Set Variable   Sauce Labs Backpack
    ${title1}=  Set Variable    Sauce Labs Bike Light
    ${title2}=  Set Variable     Sauce Labs Bolt T-Shirt
    ${title3}=  Set Variable    Sauce Labs Fleece Jacket
    ${title4}=  Set Variable    Sauce Labs Onesie
    ${title5}=  Set Variable    Test.allTheThings() T-Shirt (Red)
    @{all_titles}=    Create List    ${title}    ${title1}    ${title2}    ${title3}    ${title4}    ${title5}
    @{Product}=       Create List    Sauce Labs Backpack    Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt  Sauce Labs Fleece Jacket   Sauce Labs Onesie       Test.allTheThings() T-Shirt (Red)
    Lists Should Be Equal    @{all_titles}     @{Product}

Click on product image/title
    Login To Application
    Sleep    5s
    Click Element    //a[@id='item_4_img_link']
    ${label}    Get Text        //*[text()='Sauce Labs Backpack']
    Should Be Equal As Strings  ${label}    Sauce Labs Backpack

Clicking on Back button from Product detail
    Login To Application
    Sleep    5s
    Click Element    //a[@id='item_4_img_link']
    ${label}    Get Text        //*[text()='Sauce Labs Backpack']
    Should Be Equal As Strings  ${label}    Sauce Labs Backpack
    Sleep   3s
    Click Element    //button[@id='back-to-products']

