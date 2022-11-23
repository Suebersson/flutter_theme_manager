:: Caminhos de diretórios
::@echo %cd%
::@echo %~dp0
::@echo %ProgramFiles%
::Pause

@echo ------------------------------- Atualizar reposiorio no Github ------------------------------------------

::set GIT_PATH=C:\Program Files (x86)\Git\bin\git.exe
set BRANCH=origin
set GIT_DOMAIN=https://github.com/

::get and set project folder
for %%f in ("%cd%") do set thisFolder=%%~nxf

:: Definir a variável 'GIT_USER' manualmente
::set GIT_USER=myUserName
:: set GIT_USER ::: Ler a conta de usuário logando no git usando 'git config --get' ou '--global'
for /f %%f in ('git config --get user.name') do set GIT_USER=%%f

@echo Repositorio: %GIT_DOMAIN%%GIT_USER%/%thisFolder%.git

git init
git add .
git commit -m "name commit"
git remote add %GIT_DOMAIN%%GIT_USER%/%thisFolder%.git
git pull %BRANCH% main
git push -u %BRANCH% main

Pause

::-----------------------------------------------------------------------------------------------------------------------