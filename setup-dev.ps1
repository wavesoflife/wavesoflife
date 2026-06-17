param(
    [switch]$ForceRubyInstall
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-Command {
    param([string]$Name)
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Refresh-Path {
    $machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $env:Path = "$machinePath;$userPath"
}

function Install-Ruby-With-Winget {
    if (-not (Test-Command "winget")) {
        throw "Ruby is not installed and winget is not available. Install Ruby+DevKit from https://rubyinstaller.org/downloads/ then re-run this script."
    }

    $candidateIds = @(
        "RubyInstallerTeam.RubyWithDevKit.3.3",
        "RubyInstallerTeam.RubyWithDevKit",
        "RubyInstallerTeam.Ruby"
    )

    foreach ($packageId in $candidateIds) {
        try {
            Write-Host "Trying to install Ruby via winget package '$packageId'..."
            winget install --id $packageId --exact --accept-package-agreements --accept-source-agreements --silent
            if ($LASTEXITCODE -eq 0) {
                Refresh-Path
                if (Test-Command "ruby") {
                    return
                }
            }
        }
        catch {
            Write-Host "Package '$packageId' was not installable. Trying next candidate..."
        }
    }

    throw "Unable to install Ruby automatically with winget. Install Ruby+DevKit from https://rubyinstaller.org/downloads/ then re-run this script."
}

Push-Location $PSScriptRoot
try {
    Write-Host "Checking Ruby..."
    if ($ForceRubyInstall -or -not (Test-Command "ruby")) {
        Install-Ruby-With-Winget
    }

    if (-not (Test-Command "ruby")) {
        throw "Ruby was not found on PATH after installation. Open a new terminal and run this script again."
    }

    Write-Host "Ruby version: $(ruby --version)"

    Write-Host "Installing/Updating Bundler..."
    gem install bundler --no-document

    Write-Host "Installing project gems..."
    bundle install

    Write-Host ""
    Write-Host "Setup complete. Start the dev server with:"
    Write-Host "  .\run-dev.ps1"
}
finally {
    Pop-Location
}
