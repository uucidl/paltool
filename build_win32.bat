@echo off
setlocal
set CLFlags=%CLFLAGS%

ion paltool || exit /b 1

set O="paltool.exe"
cl out_paltool.c /Fe:"%O%" %CLFlags% -nologo || echo /b 1
echo PROGRAM	%O%

