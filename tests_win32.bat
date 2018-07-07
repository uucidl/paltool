@echo off
setlocal
set CLFlags=%CLFLAGS%

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
set IONC=out_%Module%.c
ion -o %IONC% %Module% || exit /b 1
set O="%Module%.exe"
cl "%IONC%" /Fe:"%O%" %CLFlags% -nologo || echo /b 1
echo PROGRAM	%O%	TEST
exit /b
