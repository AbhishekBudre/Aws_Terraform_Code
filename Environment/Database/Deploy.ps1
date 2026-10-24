#####################################
# you can excute these command 

#  .\Deploy.ps1 apply
#  .\Deploy.ps1 destroy

###########################################
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("apply", "destroy")]
    [string]$Action
)

$ErrorActionPreference = "Stop"

# Database folder containing this script
$Root = $PSScriptRoot

# Apply order: VPC -> KMS -> RDS
$ApplyOrder = @(
    "RDS\VPC\Dev",
    "KMS-Key\Dev",
    "RDS\Dev"
)

if ($Action -eq "apply") {
    $Folders = $ApplyOrder
}
else {
    $Folders = @($ApplyOrder)
    [array]::Reverse($Folders)
}

foreach ($Folder in $Folders) {

    $Path = Join-Path $Root $Folder

    Write-Host "`n====================================" -ForegroundColor Cyan
    Write-Host "Action: $Action" -ForegroundColor Yellow
    Write-Host "Folder: $Path" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan

    if (-not (Test-Path $Path)) {
        throw "Folder not found: $Path"
    }

    Push-Location $Path

    try {
        terraform init

        if ($LASTEXITCODE -ne 0) {
            throw "Terraform init failed in $Folder"
        }

        if ($Action -eq "apply") {

            terraform plan -out=tfplan

            if ($LASTEXITCODE -ne 0) {
                throw "Terraform plan failed in $Folder"
            }

            terraform apply tfplan

            if ($LASTEXITCODE -ne 0) {
                throw "Terraform apply failed in $Folder"
            }

            Remove-Item tfplan -Force -ErrorAction SilentlyContinue
        }
        else {

            $Confirm = Read-Host "Type YES to destroy resources in $Folder"

            if ($Confirm -ne "YES") {
                throw "Destroy cancelled by user."
            }

            terraform destroy -auto-approve

            if ($LASTEXITCODE -ne 0) {
                throw "Terraform destroy failed in $Folder"
            }
        }

        Write-Host "Completed: $Folder" -ForegroundColor Green
    }
    finally {
        Pop-Location
    }
}

Write-Host "`nAll operations completed." -ForegroundColor Green
