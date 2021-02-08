param ($projectId, $testCycle, $uploadResultsFile)

$url = 'https://pulse-7.qtestnet.com/webhook/74595985-7445-4534-af21-b40bded3cb5f'
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
