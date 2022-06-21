*** Settings ***
Documentation           [Calling custom method/Keyword from custom python library (MathOper.py)]
Library                 MathOper.py
*** Variables ***
${x}=   20
${y}=   30

*** Tasks ***
Calculate Multiplication of given numbers
    ${mult_result}=      Multiplication Of Two    ${x}    ${y}      #calling method multiplication_of_two()
    Log To Console    ${mult_result}

