setlocal
set CLFlags=%CLFLAGS%

ion filesystem_tests || exit /b 1
set O="filesystem_tests.exe"
cl out_filesystem_tests.c /Fe:"%O%" %CLFlags% || echo /b 1
echo PROGRAM	%O%	TEST

ion tasks_tests || exit /b 1
set O="tasks_tests.exe"
cl out_tasks_tests.c /Fe:"%O%" %CLFlags% || echo /b 1
echo PROGRAM	%O%	TEST


