*** Settings ***
Documentation    This is the input file for Gmail Login

*** Variables ***
${browser} =        chrome
${baseUrl} =        http://www.google.co.in

# Credentials
&{validLogin} =     email=sagarikarobot21@gmail.com    passwrd=Robot@2021
&{invalidLogin} =   email=sagarikarobot21@gmail.co     passwrd=Robot@2020     blankEmail=