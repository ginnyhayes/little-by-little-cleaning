$ErrorActionPreference='Stop'
Set-Location -LiteralPath $PSScriptRoot
$taskNode=Get-Command node -ErrorAction SilentlyContinue
if ($taskNode) { & $taskNode.Source server.cjs } else {
$taskBundledNode=Join-Path $env:USERPROFILE '.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe'
if (Test-Path -LiteralPath $taskBundledNode) { & $taskBundledNode server.cjs } else { Write-Host 'Please ask Codex to start the local preview for you.'; Read-Host 'Press Enter to close' }
}
