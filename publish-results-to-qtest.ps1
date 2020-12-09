param ($projectId, $testCycle, $uploadResultsFile)

### We can't download Artifacts now, since the x509: certificate signed by unknown authority
#if ($env:CI_PROJECT_DIR) {$content = (Get-Content '@Results/results.xml' -Raw)}
#else  {$content = (Get-Content "Results/results.xml" -Raw)}

$url = 'https://pulse-7.qtestnet.com/webhook/c3fe0169-a106-42e8-b7d9-06ee0cd924a1'
$content = (Get-Content $uploadResultsFile -Raw)
$bytes = [System.Text.Encoding]::ASCII.GetBytes($content)
$payload = [System.Convert]::ToBase64String($bytes)

$body = @{
	'projectId' = $projectId
	'testcycle' = $testCycle
	'result' = $payload
}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-RestMethod -Body $body -Method 'Post' -Uri $url
