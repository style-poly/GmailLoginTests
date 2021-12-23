*** Settings ***
Documentation    This is the step for setup & teardown - Pre requisite & post requisite of a test case
Library    SeleniumLibrary
Resource    ../Input/Input.robot

*** Keywords ***
Begin Test
    open browser   about:blank      ${browser}
    maximize browser window

End Test
    close all browsers