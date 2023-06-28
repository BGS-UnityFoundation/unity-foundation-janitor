$PROJECT_PATH = $args[0]

$Resource_folder = "$PSScriptRoot/../Resources"

Copy-Item "$Resource_folder/Tools" -Recurse -Destination $PROJECT_PATH -Force

Write-Host "Diretório de ferramentas copiado para o módulo."