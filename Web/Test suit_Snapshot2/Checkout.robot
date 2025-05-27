*** Settings ***
Resource   CommonKeywords.robot    # Adjust path as needed
*** Test Cases ***

Complete checkout
    Login To Application
    Sleep    5s
       ##Execute Javascript  document.getElementById("add-to-cart-sauce-labs-bolt-t-shirt").click()
    Add To Cart
    Sleep    5s
    Click Shopping Cart
    Sleep    5s
    # performing checkout from shopping cart
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
    Login To Application
    Sleep    5s
       ##Execute Javascript  document.getElementById("add-to-cart-sauce-labs-bolt-t-shirt").click()
    Add To Cart
    Sleep        5s
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Wait Until Element Is Visible    xpath://div[@id='shopping_cart_container']   timeout=10s
    Click Shopping Cart
    Wait Until Element Is Visible    xpath://button[@id='remove-sauce-labs-backpack']    timeout=5s
    Click Element    id:remove-sauce-labs-backpack
    Sleep    5s
    Click Element    id:continue-shopping
    Wait Until Element Is Visible    xpath=//span[@class='title']    timeout=10s
    ${title}=    Get Text    xpath=//span[@class='title']
    Should Be Equal    ${title}    Products
    Capture Page Screenshot
Clicking Cancel button checkout
    Add To Cart
    Sleep    5s
       ##Execute Javascript  document.getElementById("add-to-cart-sauce-labs-bolt-t-shirt").click()
    Add To Cart
    Sleep    5s
    Click Shopping Cart
    Sleep    10s
    Click Element    id:checkout
    Sleep    3s
    Click Element    id:cancel

