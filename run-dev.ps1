param(
    [int]$Port = 4000,
    [string]$Host = "127.0.0.1",
    [switch]$Drafts
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-Command {
    param([string]$Name)
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

Push-Location $PSScriptRoot
try {
    if (-not (Test-Command "bundle")) {
        throw "Bundler is not available. Run .\setup-dev.ps1 first."
    }

    $jekyllArgs = @("exec", "jekyll", "serve", "--livereload", "--host", $Host, "--port", "$Port")
    if ($Drafts) {
        $jekyllArgs += "--drafts"
    }

    Write-Host "Starting Jekyll dev server..."
    Write-Host "URL: http://$Host`:$Port"
    bundle @jekyllArgs
}
finally {
    Pop-Location
}
