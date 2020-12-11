$tscFile='export-report.tsc'
$timeStamp=Get-Date -Format "MMM dd, yyyy @ hh:mm:ss"

##############################################################
# CREATE TSC FILE
##############################################################
#if (Test-Path -Path $tscFile) {rm $tscFile}

rm -Force *.tsc

Add-Content $tscFile "// $tscFile //"
Add-Content $tscFile "// This file was created on $timeStamp "
Add-Content $tscFile "//#########################################################//"
Add-Content $tscFile "`n"
Add-Content $tscFile "// Update Workscae from repository //"
Add-Content $tscFile UpdateAll
Add-Content $tscFile "`n"
Add-Content $tscFile "// Navigate to the Execution List to run and one node up (to point to the folder) //"
Add-Content $tscFile "jumpToNode `"/Execution/DEX_CI_List/Tosca_tests_for_Pipeline`""
Add-Content $tscFile "`n"
Add-Content $tscFile "// Run print report task //"
Add-Content $tscFile "task `"Print Report ... ExecutionEntries with detailed Logs Modified`""

#Try {
#    if ($env:CI_PROJECT_DIR) {$exportLocation=$env:CI_PROJECT_DIR; Write-Host "[Debug] GitLab"}
#    elseif ($(System.DefaultWorkingDirectory)) {$tscFileLocation=$(System.DefaultWorkingDirectory); Write-Host "[Debug] Azure DevOps"}
#    else  {$exportLocation = split-path -parent $MyInvocation.MyCommand.Definition; Write-Host "[Debug] Local"}
#} Catch {Write-Error "WHAT THE FUCK!!!!!!!!!!!"}

#Write-Host "[Debug] MyInvocation.MyCommand.Definition: " $MyInvocation.MyCommand.Definition
Write-Host "[Debug] pwd: $(pwd)"

#$exportLocation = split-path -parent $MyInvocation.MyCommand.Definition;
#$exportLocation = $(pwd)
#Write-Host "[Debug] Export to folder: "$exportLocation

$exportFileName="$(pwd)\RunReport_$(Get-Date -Format "yyyyMMddTHHmmssffff").pdf"
#$exportLocation=$exportLocation+"\Results\"
$exportFileName=$exportFileName.Replace("\","\\")

Write-Host "[Debug] TSC file name and path: $($exportFileName)"

Add-Content $tscFile "$($exportFileName)"
Add-Content $tscFile "`n"
Add-Content $tscFile "// Exit TCShell //"
Add-Content $tscFile exit
Add-Content $tscFile "`n"
Add-Content $tscFile "// Confirm exit //"
Add-Content $tscFile y

##############################################################
# RUN TSC FILE IN TCShell
##############################################################

$TCShellExe="$Env:COMMANDER_HOME\TCShell.exe"
$workspace="$Env:TRICENTIS_PROJECTS\Tosca_Workspaces\DEX_Shared_Workspace\DEX_Shared_Workspace.tws"
$workspaceFolder=split-path -Parent $workspace
$user="`"Tosca`""
$password="`"tosca`""

#Try{
#    if ($env:CI_PROJECT_DIR) {$tscFileLocation=$env:CI_PROJECT_DIR; Write-Host "[Debug] GitLab"}
#    elseif ($(System.DefaultWorkingDirectory)) {$tscFileLocation=$(System.DefaultWorkingDirectory); Write-Host "[Debug] Azure DevOps"}
#    else  {$tscFileLocation = split-path -parent $MyInvocation.MyCommand.Definition; Write-Host "[Debug] Local"}
#}
#Catch{}

Write-Host "[Debug] Folder is: "$(pwd)\$tscFile
write-host "[Debug] Running command: `n& `"$TCShellExe`" -workspace `"$workspace`" -login $user $password `"$(pwd)\$tscFile`"`n"

&$TCShellExe -workspace $workspace -login $user $password $tscFileLocation\$tscFile
