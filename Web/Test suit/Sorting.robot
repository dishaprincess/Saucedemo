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
    ${ProductNames}  Create List                        ## getting complete HTML of listed item
    FOR    ${Itemlistobject}    IN    @{Itemlist}
     Log    ${Itemlistobject}

    END
    Sleep   10s
    ${Producttext}      GetText     ${Itemlistobject}           # Text label of listed item
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
    Sort List    ${sortedproductname}                   ## Sort list
    Lists Should Be Equal   ${sortedproductname}    ${ProductNames}







