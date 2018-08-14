@echo off
REM User Configuration
REM ==================
set HereDir=%~d0%~p0.
if not defined OutputDir set OutputDir=%HereDir%\output
if not defined ObjDir set ObjDir=%OutputDir%\obj
if not defined CLExe set CLExe=cl.exe
if not defined LinkExe set LinkExe=link.exe
if not defined IonExe set IonExe="ion"

set CLFlags=%CLFlags%
setlocal

if not exist "%OutputDir%" mkdir "%OutputDir%"
if not exist "%ObjDir%" mkdir "%ObjDir%"
if %errorlevel% neq 0 exit /b 1

call :build_test_module filesystem_tests || exit /b 1
call :build_test_module tasks_tests || exit /b 1
call :test_module paltool || exit /b 1
exit /b

:test_module
set Module=%1
ion -check -os osx %Module% || exit /b 1
ion -check %Module% || exit /b 1
exit /b

:build_test_module
set Module=%1
ion -check -os osx %Module% || exit /b 1
set IONC="%ObjDir%\out_%Module%.c"
ion -o "%IONC%" %Module% || exit /b 1
set O="%OutputDir%\%Module%.exe"
cl "%IONC%" -Fe:"%O%" -Fo:"%ObjDir%"\ %CLFlags% -nologo || echo /b 1
echo PROGRAM	%O%	TEST
exit /b
