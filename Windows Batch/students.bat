@echo off
REM	Remove all *.asx files
ECHO Deleting *.asx files
del /s /q /f C:\Users\dpaul7\VideoArchives\*.asx
ECHO Deleted!
REM Rename files
ECHO Renaming files...
SETLOCAL enabledelayedexpansion
SET folderPath=C:\Users\dpaul7\VideoArchives\
FOR %%f in (%folderPath%*) do if %%f neq %~nx0 (
	set "filename=%%~nf"
	ren "%%f" "!filename:~0,-4!%%~xf"
	ECHO Renaming file:%%f
)
rem setlocal enabledelayedexpansion
rem set "sourcePath=C:\Users\dpaul7\VideoArchives"
rem set "destPath=V:\Students"
rem for %%A in (!sourcePath!\*.asf) do (   
rem    SET fileName=%%~nA
rem    SET folder=!fileName:~35!
rem    echo !folder!
rem    copy "%%A" "!destPath!\!folder!"
rem )
rem echo Job Complete!
rem pause
rem cd ..
rem cd Desktop
