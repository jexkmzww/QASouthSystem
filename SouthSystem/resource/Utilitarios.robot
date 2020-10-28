*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Informa "${VALOR_APLICAR}", "${VALOR_POUPAR}" e "${PRAZO}"
    Execute Javascript                  ${SIMULADOR_RODAPÉ}
    Wait Until Element Is Visible       ${SIMULADOR_INPUT_VALORAPLICAR}
    Input Text                          ${SIMULADOR_INPUT_VALORAPLICAR}    ${VALOR_APLICAR}
    Input Text                          ${SIMULADOR_INPUT_VALORINVESTIR}   ${VALOR_POUPAR}
    Input Text                          ${SIMULADOR_INPUT_PRAZO}           ${PRAZO}

Clicar botão SIMULAR
    Click Button                        ${SIMULADOR_BTN_SIMULAR}
