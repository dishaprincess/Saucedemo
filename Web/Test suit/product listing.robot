*** Settings ***
Library         SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
*** Variables ***
${URL}           https://www.saucedemo.com/
${BROWSER}       chrome
${USERNAME}      standard_user
${PASSWORD}      secret_sauce
*** Test Cases ***
Clicking Humberger icon
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    10s
    Click Element    Xpath= //button[@id='react-burger-menu-btn']
    Sleep       10s
    Close Browser

Clciking on all Items
     Open Browser    ${URL}    ${BROWSER}
    Sleep    5s

    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    10s
    Click Element    Xpath=//button[@id='react-burger-menu-btn']
    Sleep       10s
    Click Element       Xpath=//a[text()='All Items']
    Sleep   10s
    Close Browser

Product listing loads
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   xpath=//input[@id='login-button']
    Sleep    5s
    Click Element    xpath=//button[@id='react-burger-menu-btn']
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
     Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   xpath=//input[@id='login-button']
    Sleep    5s
    Click Element    //a[@id='item_4_img_link']
    ${label}    Get Text        //*[text()='Sauce Labs Backpack']
    Should Be Equal As Strings  ${label}    Sauce Labs Backpack

Clicking on Back button from Product detail
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element  id:login-button
    Sleep    5s
    Click Element    //a[@id='item_4_img_link']
    ${label}    Get Text        //*[text()='Sauce Labs Backpack']
    Should Be Equal As Strings  ${label}    Sauce Labs Backpack
    Sleep   3s
    Click Element    //button[@id='back-to-products']

