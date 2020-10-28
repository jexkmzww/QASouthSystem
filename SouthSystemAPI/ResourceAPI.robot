*** Settings ***
Library         RequestsLibrary
Library         Collections

*** Variable ***
${URL_API}          http://5b847b30db24a100142dce1b.mockapi.io/api
&{INVESTIMENTO_1}   id=1
...                 meses=['112', '124', '136', '148']
...                 valor=['2.802', '3.174', '3.564', '3.971']


*** Keywords ***
Conectar a minha API
    Create Session    sicrediAPI     ${URL_API}

Requisitar o investimento "${ID_INVESTIMENTO}"
    ${RESPOSTA}         Get Request    sicrediAPI    v1/simulador
    log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir o status code
    [Arguments]                   ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]                   ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retornou uma lista com "${QTDE_INVESTIMENTOS}" investimentos
    Length Should Be              ${RESPOSTA.json()}    ${QTDE_INVESTIMENTOS}

Conferir se retorna dados corretos do investimento 1
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id       ${INVESTIMENTO_1.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    meses    ${INVESTIMENTO_1.meses}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    valor    ${INVESTIMENTO_1.valor}
