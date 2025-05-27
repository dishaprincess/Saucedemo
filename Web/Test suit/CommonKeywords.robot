*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
*** Variables ***
${URL}           https://www.saucedemo.com/
${BROWSER}       chrome
${USERNAME}      standard_user
${PASSWORD}      secret_sauce
*** Keywords ***
Login To Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    3s
Login To Application Invalid
    [Arguments]         ${username}        ${password}    ${errormessage}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s
    Input Text    id:user-name    ${username}
    Input Text    id:password     ${password}
    Click Element   id:login-button
    Sleep    3s
    ${Message}  Get Text   //h3[@data-test='error']
    Should Be Equal As Strings   ${Message}         ${errormessage}
Add To Cart
    Click Element    xpath=//button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath=//*[text()='All Items']    timeout=10s
    Click Element       xpath=//*[text()='All Items']
    Sleep   5s
    Click Element   xpath= //button[@id='add-to-cart-sauce-labs-backpack']

Click Shopping Cart
    Click Element   xpath://div[@id='shopping_cart_container'

Click Hamburger icon
    Click Element    Xpath= //button[@id='react-burger-menu-btn']