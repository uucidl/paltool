@echo off
setlocal
REM User Configuration
REM ==================
set HereDir=%~d0%~p0.
if not defined OutputDir set OutputDir=%HereDir%\output
if not defined ObjDir set ObjDir=%OutputDir%\obj
if not defined CLExe set CLExe=cl.exe
if not defined LinkExe set LinkExe=link.exe
if not defined IonExe set IonExe="ion"

set CLFlags=%CLFlags%
set LinkFlags=%LinkFlags%

if not exist "%OutputDir%" mkdir "%OutputDir%"
if not exist "%ObjDir%" mkdir "%ObjDir%"
if %errorlevel% neq 0 exit /b 1

ion -o "%ObjDir%\out_paltool.c" paltool || exit /b 1

set O="%OutputDir%\paltool.exe"
cl "%ObjDir%\out_paltool.c" -Fe:"%O%" -Fo:"%ObjDir%"\ %CLFlags% -nologo ^
 -link "%LinkFlags%" ^
 || exit /b 1
echo PROGRAM	%O%

