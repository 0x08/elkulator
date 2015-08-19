@echo off
setlocal

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat"

set CMAKE=C:\bin\cmake-3.3.0-win32-x86\bin\cmake.exe
set ALLEGRODIR=C:\src\elkulator\third-party\allegro\4.4.2
set ALLEGROINC=%ALLEGRODIR%\snapshot\include
set ALLEGROINC2=%ALLEGRODIR%\build\include
set ALLEGROLIB=%ALLEGRODIR%\build\lib\RelWithDebInfo
set CPPUNITDIR=C:\src\elkulator\third-party\cppunit\9c5b500
set CPPUNITINC=%CPPUNITDIR%\snapshot\include
set CPPUNITLIB=%CPPUNITDIR%\snapshot\lib
set FREEALUTDIR=C:\src\elkulator\third-party\freealut\fc814e3
set FREEALUTINC=%FREEALUTDIR%\snapshot\include
set FREEALUTLIB=%FREEALUTDIR%\build\src\Debug
set OPENALDIR=C:\src\elkulator\third-party\openal\1.16.0
set OPENALINC=%OPENALDIR%\snapshot\include
set OPENALLIB=%OPENALDIR%\build\Debug
set ZLIBDIR=C:\src\third-party\zlib\1.2.8\build-vs14-x86
set ZLIBINC=%ZLIBDIR%\include
set ZLIBLIB=%ZLIBDIR%\lib\Debug

cd %~dp0

if exist build (
  rd /s /q build
)
md build
cd build

%CMAKE% ^
  -G "Visual Studio 14 2015" ^
  -DBASE_INCLUDE_DIRS=%ALLEGROINC%;%ALLEGROINC2%;%CPPUNITINC%;%FREEALUTINC%;%OPENALINC%;%OPENALINC%\AL;%ZLIBINC% ^
  -DBASE_LIBS=%ALLEGROLIB%\alleg.lib;%CPPUNITLIB%\cppunitd.lib;%FREEALUTLIB%\alut.lib;%OPENALLIB%\OpenAL32.lib;%ZLIBLIB%\zlibstaticd.lib ^
  ..

msbuild elkulator.sln
