*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://petstore.swagger.io
${post_api}      /v2/pet

*** Test Cases ***
Post_request_On_Pet_Store
    [Documentation]     This is Test with nested json payload
    Create Session      petSession    ${base_url}
    ${category}=        Create Dictionary         id=${0}     name=Domestic-Pet
    ${tags}=            Create Dictionary         id=${0}     name=chihuavava
    ${tags_list}=       Create List         ${tags}
    ${photo_Urls}=      Create List     https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg


    ${req_body}=        Create Dictionary     id=${0}  category=${category}  name=Dobby    photoUrls=${photo_Urls}     tags=${tags_list}   status=healthy
    ${req_header}=      Create Dictionary     Content-Type=application/json

    ${response}=        POST On Session     petSession    ${post_api}      json=${req_body}    headers=${req_header}
    Log To Console      ${response.status_code}
    Log To Console      ${response.json()}
    Log To Console      ${response.json()}[name]     format=*^40          #returns response as json format
