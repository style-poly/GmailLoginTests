*** Settings ***
Documentation    These are the custom keywords for gmail
Resource    ../Input/Input.robot
Resource    ./PO/GoogleHomePage.robot
Resource    ./PO/GmailLandingPage.robot
Resource    ./PO/GmailLoginPage.robot
Resource    ./PO/GmailInboxPage.robot

*** Keywords ***
Check For Valid Gmail Login
    Go To Google Home   ${baseUrl}
    Select Gmail
    Click SignIn Button
    Enter Gmail Valid Credential    ${validLogin}
    Logout From Gmail

Check For Invalid Gmail Login
    Go To Google Home   ${baseUrl}
    Select Gmail
    Click SignIn Button
    Enter Gmail Invalid Credential      ${validLogin}    ${invalidLogin}

