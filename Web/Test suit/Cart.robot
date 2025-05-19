*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
Resource   ../CommonKeywords.robot    # Adjust path as needed

*** Variables ***
${URL}           https://www.saucedemo.com/
${BROWSER}       chrome
${USERNAME}      standard_user
${PASSWORD}      secret_sauce
Resource   ../CommonKeywords.robot
*** Test Cases ***

Add to cart functionality
    Login To Application
    Sleep    15s
    Click Element    xpath=//button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath=//*[text()='All Items']    timeout=10s
    Click Element       xpath=//*[text()='All Items']
    Sleep   5s
    Click Element   xpath= //button[@id='add-to-cart-sauce-labs-backpack']              # Add item from list to cart

View items in cart
    Login To Application
    Sleep    10s
    Click Element    xpath://button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath=//*[text()='All Items']    timeout=10s
    Click Element       xpath://*[text()='All Items']
    Sleep   5s
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    Sleep   5s
     ${Count}=  Get Text   //span[@class='shopping_cart_badge']

Add and remove item
    Login To Application
    Sleep    5s
    Click Element    xpath://button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath://*[text()='All Items']    timeout=20s
    ##Click Element       xpath=//*[text()='All Items']
    Click Element    id:inventory_sidebar_link
    Sleep   5s
    ##Execute Javascript  document.getElementById("add-to-cart-sauce-labs-bolt-t-shirt").click()
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Sleep    5s
    ##Click Element   xpath://div[@id='shopping_cart_container']
    ##Sleep    5s
    ${Count}=  Get Text   //span[@class='shopping_cart_badge']

     Wait Until Element Is Visible    xpath://button[@id='remove-add-to-cart-sauce-labs-bolt-t-shirt']    timeout=10s
     Execute Javascript    document.getElementById("remove-add-to-cart-sauce-labs-bolt-t-shirt").click()
    ##Execute Javascript          document.getElementById("remove-sauce-labs-backpack").click()
     Sleep  10s
     ${Count}=  Get Text   //span[@class='shopping_cart_badge']

Clikcing on cart icon
    Login To Application
    Sleep    5s
    Click Element    xpath://button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath://*[text()='All Items']    timeout=10s
    ##Click Element       xpath=//*[text()='All Items']
    Click Element    id:inventory_sidebar_link
    Sleep   5s
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5s
    Click Element   xpath://div[@id='shopping_cart_container']
Removing Item from cart
    Login To Application
    Sleep    5s
   Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
   Sleep        5s
   Click Element   xpath://button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Wait Until Element Is Visible    xpath://div[@id='shopping_cart_container']   timeout=10s
    Click Element   xpath://div[@id='shopping_cart_container']
    Wait Until Element Is Visible    xpath://button[@id='remove-sauce-labs-backpack']    timeout=5s
    Click Element    id:remove-sauce-labs-backpack
   Capture Page Screenshot
