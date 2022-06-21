*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://petstore.swagger.io
${order_api}    /v2/store/order

*** Test Cases ***
Post_request_On_Pet_Store
    Create Session      petSession    ${base_url}
    ${req_body}=        Create Dictionary     id=0  petId=0     quantity=0  shipDate=2021-12-02T12:43:37.083Z   status=placed   complete=true
    ${req_header}=      Create Dictionary     Content-Type=application/json

    ${response}=        POST On Session     petSession    ${order_api}      json=${req_body}    headers=${req_header}
    Log To Console      ${response.status_code}
    Log To Console      ${response.content}           #returns response as binary string
    Log To Console      ${response.json()}            #returns response as json format
    Status Should Be    OK                  ${response}
#    Status Should Be    200                  ${response}
