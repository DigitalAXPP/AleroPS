# .ExternalHelp cybrAlero-help.xml

$files = Get-ChildItem -Path $PSScriptRoot\*.ps1 -Recurse -File -Force

foreach ($file in $files) {
    . $file.FullName
}