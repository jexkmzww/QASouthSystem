*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIMULADOR_TITTLE}                Simulador de investimento - Poupança | Sicredi
${SIMULADOR_BTN_SIMULAR}           xpath=//*[@id="formInvestimento"]//button
${SIMULADOR_COMBOBOX_PRAZO}        xpath=//*[@id="formInvestimento"]//span[4]
${SIMULADOR_SELECIONA_PRAZO_ANOS}  xpath=//*[@id="formInvestimento"]//li[2]/a
${SIMULADOR_BTN_REFAZERSIMULAÇÃO}  xpath=//*[@class="btn btnAmarelo btnRefazer"]
${SIMULADOR_INPUT_VALORAPLICAR}    xpath=//*[@id="valorAplicar"]
${SIMULADOR_INPUT_VALORINVESTIR}   xpath=//*[@id="valorInvestir"]
${SIMULADOR_VALORAPLICARERROR}     xpath=//*[@id="valorAplicar-error"]
${SIMULADOR_VALORINVESTIRERROR}    xpath=//*[@id="valorInvestir-error"]
${SIMULADOR_TEMPOERROR}            xpath=//*[@id="tempo-error"]
${SIMULADOR_INPUT_PRAZO}           xpath=//*[@id="tempo"]
${SIMULADOR_RODAPÉ}                window.scrollTo(0,400)

*** Keywords ***
Dado que estou no simulador de investimento
    Go To               ${RESOURCE_URL}
    Title Should Be     ${SIMULADOR_TITTLE}

Quando eu aplicar "${VALOR_APLICAR}" e poupar "${VALOR_POUPAR}" por "${PRAZO_MESES}" meses
    Informa "${VALOR_APLICAR}", "${VALOR_POUPAR}" e "${PRAZO_MESES}"
    Clicar botão SIMULAR

Quando eu aplicar "${VALOR_APLICAR}" e poupar "${VALOR_POUPAR}" por "${PRAZO_ANOS}" anos
    Informa "${VALOR_APLICAR}", "${VALOR_POUPAR}" e "${PRAZO_ANOS}"
    Click Element                       ${SIMULADOR_COMBOBOX_PRAZO}
    Wait Until Element Is Visible       ${SIMULADOR_SELECIONA_PRAZO_ANOS}
    Click Element                       ${SIMULADOR_SELECIONA_PRAZO_ANOS}
    Clicar botão SIMULAR

Então quero ver minha simulação
    Wait Until Element Is Visible       ${SIMULADOR_BTN_REFAZERSIMULAÇÃO}

Quando eu aplicar "${VALOR_APLICAR}"
    Execute Javascript                  ${SIMULADOR_RODAPÉ}
    Input Text                          ${SIMULADOR_INPUT_VALORAPLICAR}          ${VALOR_APLICAR}
    Click Element                       ${SIMULADOR_INPUT_VALORINVESTIR}

Então a mensagem "${VALOR_MINIMO}" deve ser exebida
    Run Keyword If    '${SIMULADOR_VALORAPLICARERROR}'  == '${VALOR_MINIMO}'    Log      ${VALOR_MINIMO}
    Run Keyword If    '${SIMULADOR_VALORINVESTIRERROR}' == '${VALOR_MINIMO}'    Log      ${VALOR_MINIMO}

Quando eu poupar "${VALOR_POUPAR}"
    Execute Javascript                  ${SIMULADOR_RODAPÉ}
    Input Text                          ${SIMULADOR_INPUT_VALORINVESTIR}         ${VALOR_POUPAR}
    Click Element                       ${SIMULADOR_INPUT_VALORAPLICAR}

Quando eu informar tempo "${PRAZO}"
    Execute Javascript               ${SIMULADOR_RODAPÉ}
    Input Text                       ${SIMULADOR_INPUT_PRAZO}                    ${PRAZO}
    Click element                    ${SIMULADOR_INPUT_VALORINVESTIR}

Então a mensagem "${VALOR_ESPERADO}" deve existir
    Page Should Contain Element      ${SIMULADOR_TEMPOERROR}
