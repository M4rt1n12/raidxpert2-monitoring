@ECHO off
REM This sets up the name of the output file which is in the form hostname-date-time.txt
:SETUP_OUTPUT
REM Add the hostname
set output=%COMPUTERNAME%

REM Add the file extension to the end of the output filename
set output=C:\Scripte\%output%.txt

SET raidcore_tool=rcadm.exe

IF %PROCESSOR_ARCHITECTURE%==AMD64 SET work_dir="%PROGRAMFILES(x86)%\RAIDXpert2\"
IF %PROCESSOR_ARCHITECTURE%==x86 SET work_dir="%PROGRAMFILES%\RAIDXpert2\"


%work_dir%%raidcore_tool% -M -gs -v > %output%

%work_dir%%raidcore_tool% -M -qa -v >> %output%

rem Output for systeminfo command on Windows systems
Systeminfo >> %output%

type %work_dir%\RC_Service.log >> %output%
