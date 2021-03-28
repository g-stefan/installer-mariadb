@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> make %PRODUCT_NAME%

if exist temp\ rmdir /Q /S temp
if exist output\ rmdir /Q /S output

mkdir temp

7z x "vendor/mariadb-%PRODUCT_VERSION%-winx64.zip" -aoa -otemp
move "temp\mariadb-%PRODUCT_VERSION%-winx64" "output"
rmdir /Q /S temp

rmdir /Q /S output\include
del /Q /F output\bin\*.pdb
del /Q /F output\bin\*.lib
del /Q /F output\lib\*.pdb
del /Q /F output\lib\*.lib

copy /B /Y source\mariadb.template.ini output\bin\my.ini
