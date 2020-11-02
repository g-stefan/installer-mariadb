@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> installer %PRODUCT_NAME%

if exist installer\ rmdir /Q /S installer
mkdir installer

if exist build\ rmdir /Q /S build
mkdir build

makensis.exe /NOCD "util\mariadb-installer.nsi"

call grigore-stefan.sign "MariaDB" "installer\%PRODUCT_BASE%-%PRODUCT_VERSION%-installer.exe"

if exist build\ rmdir /Q /S build
