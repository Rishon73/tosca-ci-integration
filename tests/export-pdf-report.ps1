$tscFile='export-report.tsc'
$timeStamp=Get-Date -Format "MMM dd, yyyy @ hh:mm:ss"

##############################################################
# CREATE TSC FILE
##############################################################

# Delete all *tsc files
rm -Force *.tsc

# Start building the *.tsc file
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

# Build the file name and path
$exportFileName="$(pwd)\RunReport_$(Get-Date -Format "yyyyMMddTHHmmssffff").pdf"
$exportFileName=$exportFileName.Replace("\","\\")
Write-Host "[Debug] pwd: $(pwd)"

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

$exportFileName="$(Split-Path $exportFileName -Parent)\$tscFile"
if(Test-Path -Path $exportFileName) {
  # Define variables
  $TCShellExe="$Env:COMMANDER_HOME\TCShell.exe"
  $workspace="$Env:TRICENTIS_PROJECTS\Tosca_Workspaces\DEX_Shared_Workspace\DEX_Shared_Workspace.tws"
  $workspaceFolder=split-path -Parent $workspace
  $user="`"Tosca`""
  $password="`"tosca`""

  Write-Host "[Debug] Folder is: "$(pwd)\$tscFile
  write-host "[Debug] Running command: `n& `"$TCShellExe`" -workspace `"$workspace`" -login $user $password `"$(pwd)\$tscFile`"`n"

  # Run TSC file in TCShell
  &$TCShellExe -workspace $workspace -login $user $password $tscFileLocation\$tscFile
}
else {
  Write-Host "[Error]: TSC file is missing. Exiting without creating the PDF report"
  Exit -1
}
