@ECHO OFF
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