*** Settings ***
Documentation   Prova técnica de José Eduardo para South System
...             utilizando Robot Framework com SeleniumLibrary
Resource        ResourceAPI.robot
Suite Setup     Conectar a minha API

*** Test Case ***
Buscar um investimento específico
    Requisitar o investimento "1"
    Conferir o status code        200
    Conferir o reason             OK
    Conferir se retorna dados corretos do investimento 1
