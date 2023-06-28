. "$PSScriptRoot\format-json.ps1"

$PROJECT_PATH = $args[0]
$Project_name = $args[1].replace(" ", "")

$Resource_folder = "$PSScriptRoot/../Resources"

$Project_fullname = "UnityFoundation.$Project_name"
$Assets_folder = "$PROJECT_PATH/Assets"

$Code_path = "$Assets_folder/$Project_fullname"
New-Item -ItemType Directory "$Code_path" -Force | Out-Null

$package_filename = "package.json"
$package = Get-Content "$Resource_folder/$package_filename" | ConvertFrom-Json
$package.name = "coop.unityfoundation.$Project_name".ToLower()
$package.displayName = "UnityFoundation $Project_name"
ConvertTo-Json $package -Depth 100 | Format-Json | Set-Content "$Code_path/$package_filename"

$sample_asmdef = "sample.asmdef"
$asmded = Get-Content "$Resource_folder/$sample_asmdef" | ConvertFrom-Json
$asmded.name = $Project_fullname
$asmded.rootNamespace = $Project_fullname
ConvertTo-Json $asmded -Depth 100 | Format-Json | Set-Content "$Code_path/$Project_fullname.asmdef"

Write-Host "Diretório principal do módulo criado."

$Tests_folder = "$Project_fullname.Tests"
$Tests_path = "$Assets_folder/$Tests_folder"
New-Item -ItemType Directory "$Tests_path" -Force | Out-Null

$asmded = Get-Content "$Resource_folder/$sample_asmdef" | ConvertFrom-Json
$asmded.name = $Tests_folder
$asmded.rootNamespace = $Tests_folder
$asmded.includePlatforms = @("Editor")
ConvertTo-Json $asmded -Depth 100 | Format-Json | Set-Content "$Tests_path/$Tests_folder.asmdef"

Write-Host "Diretório de testes do módulo criado."

$Samples_folder = "$Project_fullname.Samples"
$Samples_path = "$Assets_folder/$Samples_folder"
New-Item -ItemType Directory "$Samples_path" -Force | Out-Null

$asmded = Get-Content "$Resource_folder/$sample_asmdef" | ConvertFrom-Json
$asmded.name = $Samples_folder
$asmded.rootNamespace = $Samples_folder
ConvertTo-Json $asmded -Depth 100 | Format-Json | Set-Content "$Samples_path/$Samples_folder.asmdef"

Write-Host "Diretório de exemplos do módulo criado."