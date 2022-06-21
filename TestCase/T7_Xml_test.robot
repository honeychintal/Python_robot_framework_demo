*** Settings ***
Library         OperatingSystem
Library         XML
Library         Collections
*** Variables ***
${xml_file}        Employee
*** Test Cases ***
TestCase_001
    ${xml_object}=      Parse Xml    TestData/${xml_file}.xml

    #Validation1 -Check single value validation
    ${emp1_Fname}=      Get Element Text     ${xml_object}      .//employee[1]/firstname
    Should Be Equal     ${emp1_Fname}        John               msg=Query MAtched
