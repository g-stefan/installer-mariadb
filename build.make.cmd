@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> make %PRODUCT_NAME%

if exist build\ rmdir /Q /S build
if exist release\ rmdir /Q /S release

mkdir build

7z x "vendor/mariadb-%PRODUCT_VERSION%-winx64.zip" -aoa -obuild
move "build\mariadb-%PRODUCT_VERSION%-winx64" "release"
rmdir /Q /S build

rmdir /Q /S release\include
del /Q /F release\bin\*.pdb
del /Q /F release\bin\*.lib
del /Q /F release\lib\*.pdb
del /Q /F release\lib\*.lib

copy /B /Y util\mariadb.template.ini release\bin\my.ini
