setlocal enabledelayedexpansion

set "sourcePath=C:\Users\dpaul7\Job\Competition"
set "destPath1=E:"
set "destPath2=F:"
set "destPath3=G:"
set "destPath4=H:"
set "destPath5=I:"
set "destPath6=N:"

rd /s /q E:\
rd /s /q F:\
rd /s /q G:\
rd /s /q H:\
rd /s /q I:\
rd /s /q N:\

robocopy !sourcePath! !destPath1! /E
robocopy !sourcePath! !destPath2! /E
robocopy !sourcePath! !destPath3! /E
robocopy !sourcePath! !destPath4! /E
robocopy !sourcePath! !destPath5! /E
robocopy !sourcePath! !destPath6! /E

echo Job Complete!
RemoveDrive E: -b
RemoveDrive F: -b
RemoveDrive G: -b
RemoveDrive H: -b
RemoveDrive I: -b
RemoveDrive N: -b
pause
