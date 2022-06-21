*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             JSONLibrary

*** Variables ***
${API_BASE}=        https://petstore.swagger.io/v2/pet


*** Keywords ***
A POST request to ${endpoint} with ${payload} should respond with ${status}
    [Documentation]     Takes submitted endpoint and response variables and plugs them into a requests call and returns the response object.
    ${api_response}=    POST  url=${endpoint}   json=${payload}  expected_status=${status}
    [Return]    ${api_response}


*** Test Cases ***
Get Baseline API Response with 200 code and expected content
    [Documentation]
    [Tags]  smoketest
    ${payload}=     Load JSON From File    TestData/T5_Post_Data.json
    # API REQUEST
    ${response}=    A POST request to ${API_BASE} with ${payload} should respond with 200
    Log To Console          ${response.json()}
    # ASSERTIONS
    dictionary should contain key   ${response.json()}    id     # Confirms the key 'items' is held within the response from the server
