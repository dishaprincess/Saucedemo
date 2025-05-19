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

Complete checkout

    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s
       ##Execute Javascript  document.getElementById("add-to-cart-sauce-labs-bolt-t-shirt").click()
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5s
    Click Element   xpath://div[@id='shopping_cart_container']
    Sleep    5s
    Click Element    id:checkout
    Sleep    3s
    Input Text    id:first-name     Disha
    Sleep       2s
    Input Text    id:last-name    Jain
    Sleep       2s
    Input Text    id:postal-code    452001
    Click Element    id:continue
    Sleep            5s
    Click Element    id:finish
    Wait Until Element Is Visible    xpath=//h2[@class='complete-header']    timeout=10s
    ${header}=    Get Text    xpath=//h2[@class='complete-header']
    Should Be Equal    ${header}   Thank you for your order!

Clicking on continue shopping option from cart
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s

   Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
   Sleep        5s
   Click Element   xpath://button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Wait Until Element Is Visible    xpath://div[@id='shopping_cart_container']   timeout=10s
    Click Element   xpath://div[@id='shopping_cart_container']
    Wait Until Element Is Visible    xpath://button[@id='remove-sauce-labs-backpack']    timeout=5s
    Click Element    id:remove-sauce-labs-backpack
    Sleep    5s
    Click Element    id:continue-shopping
    Wait Until Element Is Visible    xpath=//span[@class='title']    timeout=10s
    ${title}=    Get Text    xpath=//span[@class='title']
    Should Be Equal    ${title}    Products
    Capture Page Screenshot
Clicking Cancel button checkout
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s
       ##Execute Javascript  document.getElementById("add-to-cart-sauce-labs-bolt-t-shirt").click()
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5s
    Click Element   xpath://div[@id='shopping_cart_container']
    Sleep    10s
    Click Element    id:checkout
    Sleep    3s
    Click Element    id:cancel

