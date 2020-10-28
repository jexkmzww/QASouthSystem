*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${RESOURCE_BROWSER}   chrome
${RESOURCE_URL}       https://www.sicredi.com.br/html/ferramenta/simulador-investimento-poupanca/

*** Keywords ***
Abrir navegador
    Open Browser               about:blank     ${RESOURCE_BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser
