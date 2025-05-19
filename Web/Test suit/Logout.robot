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
Login and Then logot valid credentials
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Element   id:login-button
    Sleep    10s
    Click Element    Xpath= //button[@id='react-burger-menu-btn']
    Sleep       10s
    Wait Until Element Is Visible     xpath=//*[text()='Logout']    10s
    Click Element    xpath=//*[text()='Logout']

