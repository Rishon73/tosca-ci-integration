param ($projectId, $testCycle, $uploadResultsFile)

### We can't download Artifacts now, since the x509: certificate signed by unknown authority
#if ($env:CI_PROJECT_DIR) {$content = (Get-Content '@Results/results.xml' -Raw)}
#else  {$content = (Get-Content "Results/results.xml" -Raw)}

Write-Host  "Debug -- Results file path: " $uploadResultsFile

#$url = 'https://pulse-7.qtestnet.com/webhook/c3fe0169-a106-42e8-b7d9-06ee0cd924a1'
$url = 'https://pulse-7.qtestnet.com/webhook/74595985-7445-4534-af21-b40bded3cb5f'
$content = (Get-Content $uploadResultsFile -Raw)
Write-Host  "Debug -- content: " $content
$bytes = [System.Text.Encoding]::ASCII.GetBytes($content)
Write-Host  "Debug -- bytes: " $bytes
$payload = [System.Convert]::ToBase64String($bytes)
Write-Host  "Debug -- payload: " $payload

$body = @{
	'projectId' = $projectId
	'testcycle' = $testCycle
	'result' = $payload
}
Write-Host  "Debug -- body: " $body

#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#Invoke-RestMethod -Body $body -Method 'Post' -Uri $url
