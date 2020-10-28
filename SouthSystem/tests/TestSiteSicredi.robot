*** Settings ***
Documentation   Prova técnica de José Eduardo para South System
...             utilizando Robot Framework com SeleniumLibrary
Resource        ../resource/Resource.robot
Resource        ../resource/Simulador.robot
Resource        ../resource/Utilitarios.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Case ***
Aplicação inicial com investimento mensal
      Simulador.Dado que estou no simulador de investimento
      Simulador.Quando eu aplicar "5.000,00" e poupar "75,00" por "24" meses
      Simulador.Então quero ver minha simulação

Aplicação inicial com investimento anual
      Simulador.Dado que estou no simulador de investimento
      Simulador.Quando eu aplicar "5.000,00" e poupar "75,00" por "10" anos
      Simulador.Então quero ver minha simulação

Aplicação inicial menor que R$ 20,00
      Simulador.Dado que estou no simulador de investimento
      Simulador.Quando eu aplicar "19,99"
      Simulador.Então a mensagem "Valor mínimo de 20.00" deve ser exebida

Investimento menor que R$ 20,00
      Simulador.Dado que estou no simulador de investimento
      Simulador.Quando eu poupar "19,99"
      Simulador.Então a mensagem "Valor mínimo de 20.00" deve ser exebida

Poupar com tempo igual a 0
      Simulador.Dado que estou no simulador de investimento
      Simulador.Quando eu informar tempo "0"
      Simulador.Então a mensagem "Valor esperado não confere" deve existir
