© 2022 CalcOS, All Rights Reserved.
@echo off
:: CHANGE NUMBER TO CHNAGE NUMBER OF FILES MADE (Maybe no more than 999,999)
::||||||||||||||||||||||||||||||||||
:beninging 
title=Make the files!
color f0
@mode 70,3
echo Make files inside folder in current Directory.
set /p HOWMANYFILES=How many files do you want to make (Max 999999999)? 
::||||||||||||||||||||||||||||||||||
::set it to be exactly the number they want (DONT CHANGE)
set /a MAXIMUMMY=%HOWMANYFILES%
set /a HOWMANYFILES=%HOWMANYFILES%+1 

if %MAXIMUMMY% GTR 999999999 (
@mode 70,4
echo TOO MANY FILES.
PAUSE
goto beninging
)

:: make dir if not exist
if not exist ""%~dp0\files\"" (
mkdir ""%~dp0\files\""
)
:: Set current dir
cd "%~dp0\files"

:: do... something?? I stole this.
setlocal enableextensions enabledelayedexpansion

::For loop, I stole and repurposed because the batch language doesnt make any sense
set loop=1
set "sdate=%date%"
set "stime=%time%"
echo Attempted making files on: %date%, %time%

@mode 70,2
echo HEY, IM WORKIN' HERE!
:loop
if not exist "%~dp0\files\%loop%.txt" (
(
echo Hello %username%, I'm file number: %loop%. I love numbers.
) > File%loop%.txt
)
title=Look how fast I am. Im on File %loop%/%MAXIMUMMY%
set /a loop=%loop%+1 
if "%loop%" == "%HOWMANYFILES%" goto next
goto loop

:next
@mode 90,4
title=Finished!
set /a loop=%loop%-1
msg * "Successflully made %loop%/%MAXIMUMMY% files, check the files folder. 
echo Program Started: %sdate%, %stime%. Finished: %date%, %time%".
PAUSE
cls
goto beninging
endlocal