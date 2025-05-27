*** Settings ***
Resource   CommonKeywords.robot    # Adjust path as needed

*** Test Cases ***
Login with valid credentials
    Login To Application
Login with invalid credentials
    Login To Application Invalid    error_user1   ${PASSWORD}    Epic sadface: Username and password do not match any user in this service

Login with empty fields
    Login To Application Invalid    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required

Login with locked out user
    Login To Application Invalid    locked_out_user    ${PASSWORD}   Epic sadface: Sorry, this user has been locked out.

Login and Then logot valid credentials
    Login To Application
    Sleep    10s
    Click Element    Xpath= //button[@id='react-burger-menu-btn']
    Sleep       20s
    Wait Until Element Is Visible     xpath=//*[text()='Logout']    10s
    Click Element    xpath=//*[text()='Logout']