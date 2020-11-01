@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> installer mariadb

call build.config.cmd

if exist installer\ rmdir /Q /S installer
mkdir installer

if exist build\ rmdir /Q /S build
mkdir build

makensis.exe /NOCD "util\mariadb-installer.nsi"

call grigore-stefan.sign "MariaDB" "installer\mariadb-%PRODUCT_VERSION%-installer.exe"

if exist build\ rmdir /Q /S build
