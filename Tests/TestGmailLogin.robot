*** Settings ***
Documentation    This is to automate testing of google mail login
Resource    ../Resource/GmailCustomKeywords.robot
Resource    ../Resource/CommonKeywords.robot


Test Setup    CommonKeywords.Begin Test
Test Teardown    CommonKeywords.End Test
# robot -d result -i gmail  tests\*robot

*** Test Cases ***
TC01_Test Gmail With Valid Login
    [Tags]    gmail
    GmailCustomKeywords.Check For Valid Gmail Login

TC02_Test Gmail With Invalid Login
    [Tags]  invalid
    GmailCustomKeywords.Check For Invalid Gmail Login
