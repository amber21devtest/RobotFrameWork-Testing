*** Settings ***
Documentation     Google Maps Geocoding API
Library    String
Library    Collections    
Library    RequestsLibrary
Library    XML   



Suite Setup    Create Session    googleapi    http://maps.googleapis.com/
Suite Teardown    Delete All Sessions 

*** Keywords ***


*** Test Cases ***
Demonstrate API testing and XML response
    Postcode should match city in XML response    00500    India
    
    
*** Keywords ***
Postcode should match city in XML response
    [Arguments]    ${postal_code}    ${expected_city}

    # Make the request and verify return code
    ${response}=    Get Request     googleapi    maps/api/geocode/xml?address=${postal_code},Finland
    Should Be Equal    ${response.status_code}     ${200}

    # Parse response to XML element structure
    ${xml_response}=    Parse XML    ${response.text}

    # Get and assert element 'status' from the XML structure
    ${status_element}=    Get Element Text    ${xml_response}    status
    Should Be Equal As Strings    ${status_element}    OK

    # Verify that the expected city name can be found from the 'formatted_address' element
    ${returned_address}=     Get Element Text    ${xml_response}     result/formatted_address
    ${returned_city}=    Fetch City From Formatted Address    ${returned_address}

    Should Be Equal As Strings    ${returned_city}    ${expected_city}
    
    
    
Fetch City From Formatted Address
    [Arguments]    ${raw_address}
    ${addr}=    Fetch From Left    ${raw_address}    ,
    ${addr}=    Fetch From Right    ${addr}    ${SPACE}
    [Return]    ${addr}