*** Settings ***
Resource   ../CommonKeywords.robot    # Adjust path as needed

*** Test Cases ***
Login with valid credentials
    Login To Application
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

Login and Then logot valid credentials

    Login To Application
    Sleep    10s
    Click Element    Xpath= //button[@id='react-burger-menu-btn']
    Sleep       20s
    Wait Until Element Is Visible     xpath=//*[text()='Logout']    10s
    Click Element    xpath=//*[text()='Logout']