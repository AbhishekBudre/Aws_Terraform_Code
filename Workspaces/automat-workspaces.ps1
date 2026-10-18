
$environment = Read-Host "Select Environment: 1=Dev, 2=QA, 3=UAT, 4=Prod"

switch ($environment) {
    "1" { $workspace = "Dev" }
    "2" { $workspace = "QA" }
    "3" { $workspace = "UAT" }
    "4" { $workspace = "Prod" }
    default {
        Write-Host "Invalid environment choice!" -ForegroundColor Red
        exit
    }
}

$choice = Read-Host "Enter Action: 1=Create/Apply, 2=Destroy, 3=Switch to Default"

# Verify that the matching variable file exists
$varFile = "$workspace.tfvars"

if (-not (Test-Path $varFile)) {
    Write-Host "Error: $varFile not found in $(Get-Location)" -ForegroundColor Red
    exit
}

if ($choice -eq "1") {
    Write-Host "Deploying $workspace environment..." -ForegroundColor Green

    terraform init
    if ($LASTEXITCODE -ne 0) { exit 1 }

    terraform workspace select $workspace
    if ($LASTEXITCODE -ne 0) {
        terraform workspace new $workspace
        if ($LASTEXITCODE -ne 0) { exit 1 }
    }

    terraform validate
    if ($LASTEXITCODE -ne 0) { exit 1 }

    terraform plan -var-file="$varFile"
    if ($LASTEXITCODE -ne 0) { exit 1 }

    terraform apply -var-file="$varFile" -auto-approve
}
elseif ($choice -eq "2") {
    Write-Host "Destroying $workspace environment..." -ForegroundColor Yellow

    terraform workspace select $workspace
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Workspace $workspace does not exist." -ForegroundColor Red
        exit 1
    }

    terraform destroy -var-file="$varFile" -auto-approve
}
elseif ($choice -eq "3") {
    terraform workspace select default
    if ($LASTEXITCODE -ne 0) { exit 1 }

    $delete = Read-Host "Delete the $workspace workspace? (yes/no)"

    if ($delete -eq "yes") {
        terraform workspace delete $workspace
    }
    else {
        Write-Host "Workspace retained. Switched to default."
    }
}
else {
    Write-Host "Invalid action choice!" -ForegroundColor Red
}
