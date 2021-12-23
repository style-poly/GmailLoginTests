*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${profileIcon} =        xpath=//a[contains(@aria-label, 'sagarikarobot21')]
${logoutBtn} =          id=gb_71


*** Keywords ***
Logout From Gmail
    wait until page contains element     ${profileIcon}     timeout=10s
    click element    ${profileIcon}
    scroll element into view   ${logoutBtn}
    click element    ${logoutBtn}
    sleep    5s