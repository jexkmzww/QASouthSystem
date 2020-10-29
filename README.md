# QASouthSystem
Automação Web/API em Robot Framework com Selenium Library, RequestsLibrary e Collections. Utilizando Atom.

# Para instalar o robot framework, usar o comando:

pip install robotframework

Obs.: Necessário ter o python instalado na máquina.

# Para instalar as libraries utilizadas nos testes, usar os comandos:

pip install robotframework-selenium2library
pip install robotframework-requests

Obs.: A library Collections é importada ao se instalar o robot framework.

# Para executar o código via terminal, usar o comando:

robot -d ./results tests

Obs.: Terminal deve estar posicionado na pasta QASouthSystem.

# Para executar um caso de teste específico, usar o comando:

robot -d ./results -t "X" tests

Onde:

X = Caso de teste específico.
