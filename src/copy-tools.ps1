$PROJECT_PATH = $args[0]

$Resource_folder = "$PSScriptRoot/../Resources"

Copy-Item "$Resource_folder/Tools" -Recurse -Destination $PROJECT_PATH -Force

Write-Host "Diret�rio de ferramentas copiado para o m�dulo."