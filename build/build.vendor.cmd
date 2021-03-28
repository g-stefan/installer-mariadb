@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> vendor %PRODUCT_NAME%

if not exist vendor\ mkdir vendor

set VENDOR=mariadb-%PRODUCT_VERSION%-winx64.zip
set WEB_LINK=https://downloads.mariadb.org/interstitial/mariadb-%PRODUCT_VERSION%/winx64-packages/mariadb-%PRODUCT_VERSION%-winx64.zip/from/https%3A//mirrors.chroot.ro/mariadb/
if not exist vendor\%VENDOR% curl --insecure --location %WEB_LINK% --output vendor\%VENDOR%
