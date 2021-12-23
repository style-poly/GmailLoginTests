*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${signInBtn} =          xpath=//a[text()='Sign in']

*** Keywords ***
Click SignIn Button
    wait until element is visible    ${signInBtn}   timeout=10s
    click element    ${signInBtn}