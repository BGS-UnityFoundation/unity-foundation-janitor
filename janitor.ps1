$command = $args[0]

if ($command -eq "create") {
    Write-Host "Iniciando criação de um módulo UnityFoundation..."
    $PROJECT_PATH = $args[1]
    $Project_name = $args[2]

    if(!$PROJECT_PATH){
        Write-Host "Faltando o argumento de caminho do projeto"
        exit 1
    }

    if(!$Project_name){
        Write-Host "Faltando o argumento de nome do projeto"
        exit 1
    }

    & $PSScriptRoot/src/create-unityfoundation-project.ps1 $PROJECT_PATH $Project_name
    & $PSScriptRoot/src/copy-auxiliaries-files.ps1 $PROJECT_PATH
    & $PSScriptRoot/src/copy-tools.ps1 $PROJECT_PATH
    & $PSScriptRoot/src/create-unityfoundation-folder-tree.ps1 $PROJECT_PATH $Project_name
    & $PSScriptRoot/src/update-manifest.ps1 $PROJECT_PATH

    exit 0
}