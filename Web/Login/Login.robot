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
Login with valid credentials
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    3s
    Close Browser

Login with invalid credentials
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    error_user1
    Input Text    id:password     ${PASSWORD}
    Click Element      id:login-button
    Sleep    3s
    ${Message}  Get Text   //h3[@data-test='error']
    Should Be Equal As Strings   ${Message}   Epic sadface: Username and password do not match any user in this service
Login with empty fields
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Click Element   id:user-name
    Click Element   id:password
    Click Element   id:login-button
    Sleep    3s
    ${Message1}  Get Text   //h3[@data-test='error']
    Should Be Equal As Strings   ${Message1}   Epic sadface: Username is required

Login with locked out user
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text      id:user-name        locked_out_user
    Input Text      id:password         ${PASSWORD}
    Click Element   id:login-button
    Sleep    3s
     ${Message1}  Get Text   //h3[@data-test='error']
     Should Be Equal As Strings   ${Message1}   Epic sadface: Sorry, this user has been locked out.

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

Add to cart functionality
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s

    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element       id:login-button
    Sleep    5s
    Click Element    xpath=//button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath=//*[text()='All Items']    timeout=10s
    Click Element       xpath=//*[text()='All Items']
    Sleep   5s
    Click Element   xpath= //button[@id='add-to-cart-sauce-labs-backpack']

View items in cart
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s
    Click Element    xpath://button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath=//*[text()='All Items']    timeout=10s
    Click Element       xpath://*[text()='All Items']
    Sleep   5s
    Click Element   xpath://button[@id='add-to-cart-sauce-labs-backpack']
    Sleep   5s
     ${Count}=  Get Text   //span[@class='shopping_cart_badge']

Add and remove item
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
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
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
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
   Capture Page Screenshot
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

Clicking on sort icon sorting price low to high
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s
    ##pefroming sorting
    Click Element   xpath://select[@class='product_sort_container']
    Sleep   5s
    Click Element    //select[@class='product_sort_container']/option[3]
    ##now will check the result are sorted correctly
    ## Here we are getting boxes which has price (yha par hum we will  get boxes with price )
    ${Pricelist}    Get WebElements   xpath://div[@Class='inventory_item_price']
    ## upar jo list ayi usme se ek ek elemet get ka rhe h
    ${Pricelisttext}    Create List
    FOR    ${priceobject}    IN    @{Pricelist}
    ## here we will do processing on each element
        Log    ${priceobject}
        ${price}=  Get Text    ${priceobject} 
        Log    ${price}
        ##Evaluate    type(${price})
        ${temp}     Replace String  ${price}    $   ${EMPTY}
        ${temp}     Convert To Number   ${temp}
        Append To List    ${Pricelisttext}    ${temp}
    END
    Log    ${Pricelisttext}
    ${sortedpricelist}  Copy List    ${Pricelisttext}
    Sort List     ${sortedpricelist}
    Lists Should Be Equal   ${sortedpricelist}    ${Pricelisttext}

Clicking on sort icon sorting Name
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s
    ##pefroming sorting
    Click Element   xpath://select[@class='product_sort_container']
    Sleep   5s
    Click Element    //select[@class='product_sort_container']/option[2]
    Sleep    5s
    ${Itemlist}    Get WebElements   //div[@Class='inventory_item_name ']
    ${ProductNames}  Create List
    FOR    ${Itemlistobject}    IN    @{Itemlist}
     Log    ${Itemlistobject}

    END
    Sleep   10s
    ${Producttext}      GetText     ${Itemlistobject}
    Log    ${ProductNames}
    Append To List    ${ProductNames}    ${Producttext}
    ${sortedproductname}    copy list  ${ProductNames}  reverse=True  # Sort in descending order (Z-A)
    Sort List    ${sortedproductname}
    Lists Should Be Equal   ${sortedproductname}    ${ProductNames}
    
Clicking on sort icon # Sort in descending order (A-z)
    Open Browser     ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    5s
    ##pefroming sorting
    Click Element   xpath://select[@class='product_sort_container']
    Sleep   5s
    Click Element    //select[@class='product_sort_container']/option[1]
    Sleep    5s
    ${Itemlist}    Get WebElements   //div[@Class='inventory_item_name ']
    ${ProductNames}  Create List
    FOR    ${Itemlistobject}    IN    @{Itemlist}
     Log    ${Itemlistobject}
    END
    Sleep   10s
    ${Producttext}      GetText     ${Itemlistobject}
    Log    ${ProductNames}
    Append To List    ${ProductNames}    ${Producttext}                  ## add an element to existing list
    ${sortedproductname}    copy list  ${ProductNames}
    Sort List    ${sortedproductname}
    Lists Should Be Equal   ${sortedproductname}    ${ProductNames}


   




