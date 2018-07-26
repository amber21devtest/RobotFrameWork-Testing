###############################################
#Author : Ambarish Majee
#Date Created : 07/21/2018
#Date Modified : 07/21/2018
#Modifications
#Created the initail version of POM
###############################################
*** Settings ***
Documentation  Page Object Amazon Log in page 
Library    Selenium2Library    
Library    BuiltIn  


*** Variables ***
${Browser}  chrome
${url}   https://www.amazon.in/
${userName}  amber21devtest@gmail.com    
${passWord}  Welcome_01


*** Keywords ***
Open Browser to Log in
     Open Browser    ${url}  ${Browser}
     Maximize Browser Window
     Click Element    xpath=.//*[@id='nav-link-yourAccount']/span[2] 
    

Enter the User Name and Password
    Input Text    xpath=.//*[@id='ap_email']    ${userName}
    Click Element    xpath=.//*[@id='continue']
    Input Text    xpath=.//*[@id='ap_password']    ${passWord}
    Click Element    xpath=//*[@id="signInSubmit"]
    #Close All Browsers
     
    
  
    

