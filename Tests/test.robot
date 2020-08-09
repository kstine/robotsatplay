*** Settings ***
Documentation  Test for common value between two lists

*** Variables ***
@{LISTA} =  Beer  Tofu  Rat Poison
@{LISTB} =  Rat Poison  Poo

*** Test Cases ***
Do things
    [Tags]  things
    Log To Console  ${LISTA}
    Log To Console  ${LISTB}
    ${lenlista} =  Evaluate  "lista=" + str(len(${LISTA}))
    ${lenlistb} =  Evaluate  "listb=" + str(len(${LISTB}))
    ${evalbool} =  Evaluate  len(${LISTA})==len(${LISTB})
    ${bool} =  Evaluate  any(check in ${LISTA} for check in ${LISTB})
    @{eval} =  Run Keyword If  ${bool}==True
    ...  Evaluate  [value for value in ${LISTA} if value in ${LISTB}]
    Log To Console  ${lenlista} ${lenlistb} Equal=${evalbool} ${eval} ${evalbool}

*** Keywords ***