
###############################################
#Author : Ambarish Majee
#Date Created : 07/23/2018
#Date Modified : 07/23/2018
#Modifications
#Test the API testing Automation
###############################################

*** Settings ***
Documentation    This Test is to test the
...    Formula one racing reuslts 
Library    Collections    
Library    XML    
Library    RequestsLibrary    
Library    String   


Suite Setup    Create Session    ergast    http://ergast.com/api
Suite Teardown    Delete All Sessions  

*** Variables ***
${series}  f1
${season}  2008
${round}  1

*** Test Cases ***
Test the Webservices of Formula One 
  Test response for successful HTTP requests  f1  2008  1
  Test The XML Response of the Request  f1  2008  1
  
*** Keywords ***

Test response for successful HTTP requests
    [Arguments]    ${series}  ${season}  ${round}
    ${response}=  Get Request    ergast    /${series}/${season}/${round}
    Should Be Equal    ${response.status_code}     ${200}
    
Test The XML Response of the Request
    [Arguments]    ${series}  ${season}  ${round}
    ${response}=  Get Request    ergast    /f1/seasons
    # Parse response to XML element structure
    ${xml_response}=    Parse XML    ${response.text}

            
            
            
            
    