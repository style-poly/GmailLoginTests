*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${emailInput} =         xpath=//input[@type='email']
${nextBtn} =            xpath=//button[@type='button']//span[text()='Next']
${passwrdInput} =       xpath=//input[@type='password']
${passError} =          //span[contains(text(),'Wrong password.')]
${emailerrorNote} =     //div[contains(text(),'find your Google Account')]
${noEmailNote} =        //div[contains(text(),'Enter an email or phone number')]


*** Keywords ***
Enter Gmail Valid Credential
    [Arguments]    ${validLogin}
    wait until element is visible    ${emailInput}
    input text    ${emailInput}     ${validLogin.email}
    click element    ${nextBtn}
    wait until element is visible    ${passwrdInput}
    input password    ${passwrdInput}   ${validLogin.passwrd}
    click element    ${nextBtn}

Enter Gmail Invalid Credential
    [Arguments]     ${validLogin}    ${invalidLogin}
    ${flag}     get value from user    enter true or false:
#To check on Test Cases
    IF      '${flag}' == 'True'
    run keyword    Proceed With Invalid Password    ${validLogin}    ${invalidLogin}
    ELSE IF     '${flag}' == 'False'
    run keyword    Proceed With Invalid Email   ${validLogin}    ${invalidLogin}
    ELSE
    run keyword    Proceed With No Email
    END

Proceed With Invalid Password
    [Arguments]     ${validLogin}    ${invalidLogin}
    wait until element is visible    ${emailInput}
    input text    ${emailInput}     ${validLogin.email}
    click element    ${nextBtn}
    wait until element is visible    ${passwrdInput}
    input password    ${passwrdInput}   ${invalidLogin.passwrd}
    click element    ${nextBtn}
    wait until element is visible    ${passerror}
    ${test}     get text    ${passerror}
    element text should be    ${passerror}  ${test}


Proceed With Invalid Email
    [Arguments]     ${validLogin}    ${invalidLogin}
    wait until element is visible    ${emailInput}
    input text    ${emailInput}     ${invalidLogin.email}
    click element    ${nextBtn}
    wait until page contains element    ${emailerrorNote}
    ${test}     get text    ${emailerrorNote}
    element text should be    ${emailerrorNote}      ${test}


Proceed With No Email
    wait until element is visible    ${emailInput}
#    input text    ${emailInput}     ${invalidLogin.blankEmail}
    click element    ${nextBtn}
#    sleep    5s
    wait until element is visible    ${noEmailNote}     timeout=10s
    ${test}     get text   ${noEmailNote}
    element text should be    ${noEmailNote}      ${test}
