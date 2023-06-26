. "$PSScriptRoot\format-json.ps1"

$compliance_dependencies = @(
    "com.unity.ide.visualstudio",
    "com.unity.render-pipelines.universal",
    "com.unity.test-framework",
    "com.unity.textmeshpro",
    "com.unity.timeline",
    "com.unity.ugui",
    "com.unity.modules.ai",
    "com.unity.modules.animation",
    "com.unity.modules.assetbundle",
    "com.unity.modules.audio",
    "com.unity.modules.imageconversion",
    "com.unity.modules.imgui",
    "com.unity.modules.jsonserialize",
    "com.unity.modules.particlesystem",
    "com.unity.modules.physics",
    "com.unity.modules.physics2d",
    "com.unity.modules.screencapture",
    "com.unity.modules.ui",
    "com.unity.modules.uielements",
    "com.unity.modules.video"
)

$PROJECT_PATH = $args[0]
$manifest_file = "manifest.json"
$manifest = Get-Content "$PROJECT_PATH/Packages/$manifest_file" | ConvertFrom-Json

$newDependencies = @{}
foreach ($dependency in $compliance_dependencies) {
    $newDependencies.Add($dependency, $manifest.dependencies."$dependency")
}

$manifest.dependencies = $newDependencies
ConvertTo-Json $manifest -Depth 100 | Format-Json | Set-Content "$PROJECT_PATH/Packages/$manifest_file"

Write-Host "Manifesto do projeto foi atualizado."