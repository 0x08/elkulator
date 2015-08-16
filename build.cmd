@echo off
setlocal

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat"

set CMAKE=C:\bin\cmake-3.3.0-win32-x86\bin\cmake.exe
set DIRECTXDIR=C:\src\elkulator\third-party\directx\7
set DIRECTXINC=%DIRECTXDIR%\snapshot\include
set DIRECTXLIB=%DIRECTXDIR%\snapshot\lib
set ZLIBDIR=C:\src\elkulator\third-party\zlib\1.2.8
set ZLIBINC=%ZLIBDIR%\snapshot
set ZLIBLIB=%ZLIBDIR%\build\Debug
set PNGDIR=C:\src\elkulator\third-party\libpng\1.6.18
set PNGINC=%PNGDIR%\snapshot
set PNGLIB=%PNGDIR%\build\Debug
set OGGDIR=C:\src\elkulator\third-party\libogg\1.3.2
set OGGINC=%OGGDIR%\snapshot\include
set OGGLIB=%OGGDIR%\snapshot\win32\VS2015\Win32\Debug
set VORBISDIR=C:\src\elkulator\third-party\libvorbis\1.3.5
set VORBISINC=%VORBISDIR%\snapshot\include
set VORBISLIB=%VORBISDIR%\snapshot\win32\VS2015\Win32\Debug
set ALLEGRODIR=C:\src\elkulator\third-party\allegro\4.4.2
set ALLEGROINC=%ALLEGRODIR%\snapshot\include
set ALLEGROINC2=%ALLEGRODIR%\build\include
set OPENALDIR=C:\src\elkulator\third-party\openal\1.16.0
set OPENALINC=%OPENALDIR%\snapshot\include
set FREEALUTDIR=C:\src\elkulator\third-party\freealut\fc814e3
set FREEALUTINC=%FREEALUTDIR%\snapshot\include

cd %~dp0

rem if exist build (
rem   rd /s /q build
rem )
rem md build
cd build

goto :Foo
%CMAKE% ^
  -G "Visual Studio 14 2015" ^
  -DDDRAW_INCLUDE_DIR=%DIRECTXINC% ^
  -DDDRAW_LIBRARY=%DIRECTXLIB%\ddraw.lib ^
  -DDINPUT_INCLUDE_DIR=%DIRECTXINC% ^
  -DDINPUT_LIBRARY=%DIRECTXLIB%\dinput.lib ^
  -DDSOUND_INCLUDE_DIR=%DIRECTXINC% ^
  -DDSOUND_LIBRARY=%DIRECTXLIB%\dsound.lib ^
  -DDXGUID_LIBRARY=%DIRECTXLIB%\dxguid.lib ^
  -DZLIB_INCLUDE_DIR=%ZLIBINC% ^
  -DZLIB_LIBRARY=%ZLIBLIB%\zlibstaticd.lib ^
  -DPNG_PNG_INCLUDE_DIR=%PNGINC% ^
  -DPNG_LIBRARY=%PNGLIB%\libpng16_staticd.lib ^
  -DOGG_INCLUDE_DIR=%OGGINC% ^
  -DOGG_LIBRARY=%OGGLIB%\libogg_static.lib ^
  -DVORBIS_INCLUDE_DIR=%VORBISINC% ^
  -DVORBIS_LIBRARY=%VORBISLIB%\libvorbis_static.lib ^
  -DVORBISFILE_LIBRARY=%VORBISLIB%\libvorbisfile_static.lib ^
  ..
:Foo

set INCLUDE=%ALLEGROINC%;%ALLEGROINC2%;%ZLIBINC%;%OPENALINC%;%OPENALINC%\AL;%FREEALUTINC%;%INCLUDE%
set UseEnv=true
msbuild elkulator.sln
