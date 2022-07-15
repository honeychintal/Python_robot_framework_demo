*** Settings ***
Documentation           [Calling custom method/Keyword from custom python library (RequestsDemo)]
Library                 MathOper.py
Library             RequestsLibrary
Library             OperatingSystem
Library             ../Lib/RequestsDemo.py

*** Variables ***
${query}=           ?page=2/
${API_BASE}=        https://reqres.in/api/users${query}  # tests default to the sandbox environment
${cleanup}=         ${False}  # False is a built-in RF variable

*** Keywords ***
A GET request to ${endpoint} should respond with ${status}
    [Documentation]     Custom GET keyword with status validation.
    ${api_response}=    GET     url=${endpoint}  expected_status=${status}
    [Return]    ${api_response}

*** *** Test Cases ***
Get Base Sports Endpoint API Response
    [Documentation]     Simple validation of the base level schema url.
    [Tags]  valid
    ${response}=    A GET request to ${API_BASE} should respond with 200
    ${result}=    Sports Schema from ${response} should be valid
    Log To Console    ${result}

