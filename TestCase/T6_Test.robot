*** Settings ***
Library     JSONLibrary

*** Variables ***
${json_file}        T6_Data
*** Test Cases ***
Test One:
    [Documentation]     reading json data from json file with JSONLibrary
    ${json_obj}=    Load JSON From File    TestData/${json_file}.json
    ${name_field}=  Get Value From Json    ${json_obj}    $.data.first_name
    Log To Console    ${name_field}
