. "$PSScriptRoot\format-json.ps1"

$PROJECT_PATH = $args[0]
$Project_name = $args[1]

$Project_fullname = "UnityFoundation.$Project_name"
$Assets_folder = "$PROJECT_PATH/Assets"

$Code_path = "$Assets_folder/$Project_fullname"
New-Item -ItemType Directory "$Code_path" -Force | Out-Null

$package_filename = "package.json"
$package = Get-Content "$PSScriptRoot/../Resources/$package_filename" | ConvertFrom-Json
$package.name = "coop.unityfoundation.$Project_name".ToLower()
$package.displayName = "UnityFoundation $Project_name"
ConvertTo-Json $package -Depth 100 | Format-Json | Set-Content "$Code_path/$package_filename"

Write-Host "Diretório principal do módulo criado."

$Tests_path = "$Assets_folder/$Project_fullname.Tests"
New-Item -ItemType Directory "$Tests_path" -Force | Out-Null
New-Item -ItemType File "$Tests_path/.keep" -Force | Out-Null
Write-Host "Diretório de testes do módulo criado."

$Samples_path = "$Assets_folder/$Project_fullname.Samples"
New-Item -ItemType Directory "$Samples_path" -Force | Out-Null
New-Item -ItemType File "$Samples_path/.keep" -Force | Out-Null
Write-Host "Diretório de exemplos do módulo criado."