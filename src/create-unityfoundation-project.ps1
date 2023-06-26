. "$PSScriptRoot\format-json.ps1"

$PROJECT_PATH = $args[0]
$Project_name = $args[1]

$package_filename = "project.json"
$package = Get-Content "$PSScriptRoot/../Resources/$package_filename" | ConvertFrom-Json
$package.name = "UnityFoundation.$Project_name"
$package.package_file = "Assets/UnityFoundation.$Project_name/package.json"

$unity_package_name = $Project_name.replace(' ', '-').ToLower()
$package.unity_package.name = "unityfoundation-$unity_package_name"
$package.unity_package.export_folders = @("Assets/UnityFoundation.$Project_name")
ConvertTo-Json $package -Depth 100 | Format-Json | Set-Content "$PROJECT_PATH/$package_filename"