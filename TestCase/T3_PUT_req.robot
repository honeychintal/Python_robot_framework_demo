*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://reqres.in
${put_api}    /api/users/2

*** Test Cases ***
Post_request_On_Pet_Store
    Create Session      petSession    ${base_url}
    ${req_body}=        Create Dictionary         name=morpheus     job=zion resident
    ${req_header}=      Create Dictionary     Content-Type=application/json

    ${response}=        PUT On Session     petSession    ${put_api}      json=${req_body}    headers=${req_header}
    Log To Console      ${response.status_code}
    Log To Console      ${response.json()}[job]     format=*^40          #returns response as json format
