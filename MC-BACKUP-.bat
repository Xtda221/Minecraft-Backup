@ECHO OFF
CLS
TITLE MINECRAFT-BACKUP
COLOR 0A
:: SIZE
MODE con cols=75 lines=5 & COLOR 0B
:: SHORTCUTS
SET G~= GOTO 
SET D~!1!= %USERPROFILE%\Desktop
SET C= CLS
ECHO.
ECHO                                .MINECRAFT BACKUP.
GOTO CHOICES
REM IF INPUT MODS FOLDER THEN, WELL BE COPIED AND SECURED BACKUP


:: LET THE USER CHOICE
:CHOICES
CLS
CHOICE /N /M "BACK UP ALL? [Y/N]"

IF ERRORLEVEL == 2 (
		%G~% BACKUP-CHOICE
)

:BACKUP-ALL
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
SET alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
SET pwd2=
FOR /L %%b IN (0, 1, 4) DO (
SET /A rnd_num=!RANDOM! * 36 / 32768 + 1
FOR /F %%c in ('ECHO %%alfanum:~!rnd_num!^,1%%') DO SET pwd2=!pwd2!%%c
)
MKDIR %USERPROFILE%\Desktop\BACKUP-%pwd2%
SET BACKUP= XCOPY /S/E "C:\Users\%USERNAME%\AppData\Roaming\.minecraft" "%USERPROFILE%\Desktop\BACKUP-%pwd2%"
SET BACKUP2= XCOPY /S/E "%LOC%" "%USERPROFILE%\Desktop\BACKUP-%pwd2%"
CLS
COLOR 0F
CHOICE /N /M "IS YOUR MINECRAFT FOLDER ON APPDATA ? [Y/ COMING SOON]"

IF ERRORLEVEL == 1 (
	ECHO --------------
	ECHO LOADING...
	ECHO --------------
	PING LOCALHOST -n 5 >NUL
	MODE con cols=999 lines=999 & COLOR 05
    %BACKUP%
    PAUSE
	)


:BACKUP-CHOICE
CLS
MODE con cols=75 lines=10 & COLOR 0B
COLOR 0A
    ECHO.
	ECHO                    ++------------------++
	ECHO                      !BACKUP COMPLETED
	ECHO                    ++------------------++
    CD %USERPROFILE%\Desktop\BACKUP-%pwd2%
	ECHO. 2> BACKUP.txt
	ECHO BACKUP COMPLETED,  INFO: > BACKUP.txt
	ECHO ALL FILES HAS BACKUPED, NO FILES GONE OR DELETED >> BACKUP.txt
	ECHO ---------------------------------------------------------------- >> BACKUP.txt
    CALL :DATE_TIME >> BACKUP.txt
	ECHO.
	SET /P P= PRESS ANY KEY 
    EXIT /B
:: DATE_TIME
:DATE_TIME
SET hour=%time:~0,2%
IF "%hour:~0,1%" == " " SET hour=0%hour:~1,1%
SET min=%time:~3,2%
IF "%min:~0,1%" == " " SET min=0%min:~1,1%
SET year=%date:~-4%
ECHO !%year% - %hour%:%min%! 
