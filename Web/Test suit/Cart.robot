*** Settings ***
Resource   ../CommonKeywords.robot    # Adjust path as needed

*** Test Cases ***

Add to cart functionality
    Login To Application
    Sleep    15s
    Add To Cart                # Add item from list to cart
View items in cart
    Login To Application
    Sleep    10s
    Add To Cart
    Sleep   5s
    ${Count}=  Get Text   //span[@class='shopping_cart_badge']
Add and remove item
    Login To Application
    Sleep    5s
    Add To Cart
    Sleep    5s
    # Get Cart Count After Adding
    ${Count}=    Get Text    //span[@class='shopping_cart_badge']
    Log    Cart Count After Adding: ${Count}
    Wait Until Element Is Visible    id=remove-sauce-labs-backpack    timeout=10s
    Execute Javascript    document.getElementById("remove-sauce-labs-backpack").click()
    Sleep    5s

Clikcing on cart icon
    Login To Application
    Sleep    5s
    Add To Cart
    Sleep    5s
    Click Element   xpath://div[@id='shopping_cart_container']
Removing Item from cart
   Login To Application
   Sleep    5s
   Add To Cart
   Sleep        5s
   Click Element   xpath://button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
   Wait Until Element Is Visible    xpath://div[@id='shopping_cart_container']   timeout=10s
   Click Element   xpath://div[@id='shopping_cart_container']
   Wait Until Element Is Visible    xpath://button[@id='remove-sauce-labs-backpack']    timeout=5s
   Click Element    id:remove-sauce-labs-backpack
   Capture Page Screenshot
