@echo off
@echo Uploading Psi+ Installer to Google Code
call autobuild\googlecode_upload.py -p "psi-dev" -s "Psi+ Windows Installer with 30+ translations || psi-git 28.10.2012 15:40 MSD || Qt 4.8.2 || Win32 OpenSSL Libs v1.0.1� || Psimedia/GStreamer included" -l "Featured,Windows,Installer" "setup\psi-plus-0.16.25-win32-setup.exe"
@echo Completed
pause & pause
