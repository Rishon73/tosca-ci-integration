param ($resultsFile='results.xml', $executionListFile='conf-execution-list.xml', $local='True')

# Create the Results folder if it's not there
if ( -not (Test-Path -LiteralPath 'Results' -PathType Container) ) { mkdir Results }

# Get the 'COMMANDER_HOME' environment parameter
$ToscaCommanderHome = [System.Environment]::GetEnvironmentVariable('COMMANDER_HOME')
$ToscaHostedServerAddrs = 'http://13.68.251.236:90'
$ToscaLocalServerAddrs = 'http://toscademovm:90'

if($local -eq 'True'){$ToscaServer = $ToscaLocalServerAddrs}
else {$ToscaServer = $ToscaHostedServerAddrs}

# This is how the command should look like
#'...\ToscaCI\Client\ToscaCIClient.exe' -m distributed -t junit -x True -r 'results.xml' -c TestsConfiguration\api-execution-list.xml -e http://toscademovm:90/DistributionServerService/ManagerService.svc

$ToscaCIClientExe = $ToscaCommanderHome + '\ToscaCI\Client\ToscaCIClient.exe'

$m = 'distributed'
$t = 'junit'
$x = 'True'
$r = $resultsFile
$c = $executionListFile
$e = $ToscaServer+'/DistributionServerService/ManagerService.svc'

Write-Host "Running command: `n& $ToscaCIClientExe -m $m -t $t -x $x -r $r -c $c -e $e`n"

& $ToscaCIClientExe -m $m -t $t -x $x -r $r -c $c -e $e
