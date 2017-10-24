@echo off
  ::Choose the letter of the drive to be cleaned
set /P usb=[Introduce la letra de la unidad USB a desinfectar]

msg * MNZcleaner esta reparando la unidad %usb%:

  ::Now it cleans the USB device from the files of the trojan and it restores the original files to a new folder
rd /S /Q %usb%:WindowsServices
%usb%:
  del /Q *.lnk
  attrib -h -r -s /s /d %usb%:_ 
  move /Y %usb%:_ %usb%:Recuperado

msg * MNZcleaner esta reparando el equipo

  ::Now it removes the files from the computer and kills the task started by the virus
rd /S /Q C:\users\%username%\AppData\Roaming\WindowsServices
cd C:\users
del /Q /S helper.vbs
del /Q /S movemenoreg.vbs
del /Q /S installer.vbs
taskkill /F /IM wscript.exe
del /Q /S helper.lnk

msg * Ha sido limpiado por MNZcleaner
