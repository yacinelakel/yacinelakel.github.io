<#Remove old main.js#>
Remove-Item "main.*.js"

<#Generate guid#>
$id = New-Guid;
$mainFile = "main." + $id + ".js"
<#Run elm make #>
$elmMake = "elm make src\Main.elm --output=" + $mainFile;
Invoke-Expression $elmMake 

<#Update index.html#>
$html = Get-Content .\index.html;

$html | ForEach-Object {$_ -replace '<script src="main.*"></script>', ('<script src="' + $mainFile + '"></script>')} | 
Set-Content .\index.html 