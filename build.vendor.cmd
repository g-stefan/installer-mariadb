@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

if not exist vendor\ mkdir vendor

set VENDOR=mariadb-10.5.5-winx64.zip
set WEB_LINK=https://downloads.mariadb.org/interstitial/mariadb-10.5.5/winx64-packages/mariadb-10.5.5-winx64.zip/from/https%3A//mirrors.chroot.ro/mariadb/
if not exist vendor\%VENDOR% curl --insecure --location %WEB_LINK% --output vendor\%VENDOR%
