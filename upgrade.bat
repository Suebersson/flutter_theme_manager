@ECHO off
:: ########## Caminhos de diretorios ###########
::@echo %cd%
::@echo %~dp0
::@echo %ProgramFiles%
::Pause

::set GIT_PATH=C:\Program Files (x86)\Git\bin\git.exe
set BRANCH=origin
set GIT_DOMAIN=https://github.com/

::get and set this project folder
for %%f in ("%cd%") do set thisFolder=%%~nxf

:: Definir o nome da conta de usuario na variavel 'GIT_USER' manualmente
::set GIT_USER=myUserName
:: set GIT_USER ::: Ler a conta de usuario logando no git usando 'git config --get' ou '--global'
for /f %%f in ('git config --get user.name') do set GIT_USER=%%f

@echo.
@echo ================================ Atualizar reposiorio no Github ================================
@echo.
@echo Usuario(a): %GIT_USER%
@echo Repositorio: %GIT_DOMAIN%%GIT_USER%/%thisFolder%.git
@echo.
@echo ================================================================================================
@echo.

git init
git add .
git commit -m "name commit"
git remote add %BRANCH% %GIT_DOMAIN%%GIT_USER%/%thisFolder%.git
git pull %BRANCH% main
git push -u %BRANCH% main

@echo.
@echo.
Pause

::-----------------------------------------------------------------------------------------------------------------------