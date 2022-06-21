***** Settings ***
Library     RequestsLibrary
Library     Collections
***** Variables ***
${base_url}     https://reqres.in/
${user_ID}      2

***** Test Cases ***
Get_SingleUserInfo
    Create Session      mySession       ${base_url}
    ${response}=        GET On Session      mySession       api/users/${user_ID}
    Log To Console      ${response.status_code}
    Log To Console      ${response.content}
    Log To Console      ${response.headers}

    #VALIDATIONS
    ${status_code}=     convert to string       ${response.status_code}
    ${response_body}=   convert to string       ${response.content}
    Should Be Equal     ${status_code}          200
    Should Contain      ${response_body}        janet.weaver@reqres.in
    ${content_type}=    Get From Dictionary     ${response.headers}     Content-Type    # 'Get From Dictionary' is keyowrd that returns the value of given key from dictionary
    Log To Console      ${content_type}