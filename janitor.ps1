$command = $args[0]

if ($command -eq "create") {
    Write-Host "Iniciando criação de um módulo UnityFoundation..."
    $PROJECT_PATH = $args[1]
    $Project_name = $args[2]

    & $PSScriptRoot/Tools/create-unityfoundation-project.ps1 $PROJECT_PATH $Project_name
    & $PSScriptRoot/Tools/create-unityfoundation-folder-tree.ps1 $PROJECT_PATH $Project_name
    & $PSScriptRoot/Tools/update-manifest.ps1 $PROJECT_PATH

    exit 0
}