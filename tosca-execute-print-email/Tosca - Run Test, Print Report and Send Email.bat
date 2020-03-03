@ECHO off

REM Tosca - Run Test, Print Report and Send Email.bat

REM --- In case you want to move the created report to a time-stamped folder ---
REM SET TIME_STAMP=%date:~10,4%%date:~4,2%%date:~7,2%%time:~,2%%time:~3,2%%time:~6,2%%time:~9,2%
REM MKDIR "%cd%\%RES_FOLDER%"
REM CD "%cd%\%RES_FOLDER%"

CALL "%COMMANDER_HOME%\TCShell.exe" -workspace "%TRICENTIS_PROJECTS%Tosca_Workspaces\YOUR_WORKSPACE\YOUR_WORKSPACE.tws" "RunTCShellCommands.tcs"

REM --- In case you want to move the created report to a time-stamped folder ---
REM MOVE ExecutionReport.pdf ExecutionReport_%TIME_STAMP%.pdf
