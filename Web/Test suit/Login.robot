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

