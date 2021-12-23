*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${gmailIcon} =          xpath=//a[text()='Gmail']

*** Keywords ***
Go To Google Home
    [Arguments]    ${baseUrl}
    go to    ${baseUrl}

Select Gmail
    wait until element is visible    ${gmailIcon}
    click element    ${gmailIcon}