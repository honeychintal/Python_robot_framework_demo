*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem

*** Variables ***
${base_url}     https://petstore.swagger.io  #Host/Base Url
${post_api}      /v2/pet    #Api endpoint
${json_file}    T5_Post_Data  #Json payload file name
*** Test Cases ***
Post_request_On_Pet_Store
    [Documentation]     Test with json payload Reading from json file stored in TestData
    Create Session      petSession    ${base_url}

    ${json_file}=       Get File      TestData/${json_file}.json
    ${req_body}=       Evaluate      ${json_file}           #evaluate used for converting sting data to json
    ${req_header}=      Create Dictionary     Content-Type=application/json
    Log To Console      ${req_body}

    ${response}=        POST On Session     petSession    ${post_api}      json=${req_body}    headers=${req_header}
    Log To Console      ${response.status_code}
    Log To Console      ${response.json()}
    Log To Console      ${response.json()}[id]     format=*^40          #returns response as json format
