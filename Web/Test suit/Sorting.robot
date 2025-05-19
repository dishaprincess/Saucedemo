*** Settings ***
Resource   ../CommonKeywords.robot    # Adjust path as needed

*** Test Cases ***

Clicking on sort icon sorting price low to high
    Login To Application
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
    Login To Application
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
    Login To Application
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







