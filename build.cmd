@echo off
setlocal

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat"

set CMAKE=C:\bin\cmake-3.3.0-win32-x86\bin\cmake.exe
set DROPDIR=build-vs14-x86
set ALLEGRODIR=C:\src\third-party\allegro\4.4.2\%DROPDIR%
set ALLEGROINC=%ALLEGRODIR%\include
set ALLEGROLIB=%ALLEGRODIR%\lib\RelWithDebInfo
set CPPUNITDIR=C:\src\third-party\cppunit\9c5b500\%DROPDIR%
set CPPUNITINC=%CPPUNITDIR%\include
set CPPUNITLIB=%CPPUNITDIR%\lib\Debug
set ZLIBDIR=C:\src\third-party\zlib\1.2.8\%DROPDIR%
set ZLIBINC=%ZLIBDIR%\include
set ZLIBLIB=%ZLIBDIR%\lib\Debug

set FREEALUTDIR=C:\src\elkulator\third-party\freealut\fc814e3
set FREEALUTINC=%FREEALUTDIR%\snapshot\include
set FREEALUTLIB=%FREEALUTDIR%\build\src\Debug
set OPENALDIR=C:\src\elkulator\third-party\openal\1.16.0
set OPENALINC=%OPENALDIR%\snapshot\include
set OPENALLIB=%OPENALDIR%\build\Debug

cd %~dp0

rem if exist build (
rem   rd /s /q build
rem )
rem md build
cd build

%CMAKE% ^
  -G "Visual Studio 14 2015" ^
  -DBASE_INCLUDE_DIRS=%ALLEGROINC%;%CPPUNITINC%;%FREEALUTINC%;%OPENALINC%;%OPENALINC%\AL;%ZLIBINC% ^
  -DBASE_LIBS=%ALLEGROLIB%\alleg44.lib;%CPPUNITLIB%\cppunitd.lib;%FREEALUTLIB%\alut.lib;%OPENALLIB%\OpenAL32.lib;%ZLIBLIB%\zlibstaticd.lib ^
  ..

msbuild elkulator.sln
