$PROJECT_PATH = $args[0]

$Resource_folder = "$PSScriptRoot/../Resources"

Copy-Item "$Resource_folder/.gitignore" -Destination $PROJECT_PATH | Out-Null
Copy-Item "$Resource_folder/.vsconfig" -Destination $PROJECT_PATH | Out-Null
Copy-Item "$Resource_folder/.editorconfig" -Destination $PROJECT_PATH | Out-Null
Copy-Item "$Resource_folder/README.md" -Destination $PROJECT_PATH | Out-Null

Write-Host "Arquivos auxiliares copiados."