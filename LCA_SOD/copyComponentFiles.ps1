function CopyEETComponents($fileType, $components)
{
	Remove-Item -LiteralPath $fileType -Force -Recurse
	New-Item -ItemType Directory -Force -Path $fileType
	
	foreach($component in $components)
	{
		Copy-Item -Path ($path_LCAEET + $fileType + '\' + $component + '.' + $fileType) -Destination ($fileType + '\' + $component + '.' + $fileType)
	}
}

function CopyTRAComponents($language, $components)
{	
	foreach($component in $components)
	{
		Copy-Item -Path ($path_LCAEET + 'TRA\' + $language + '\' + $component + '.TRA') -Destination ('TRA\' + $language + '\' +  $component + '.TRA')
	}
}

Clear-Host

$path_LCAEET = "..\..\LCA\"

$AREcomponents = @(
'XATENT'
)

$BAFcomponents = @(
'XATNTSCR'
)

$BMPcomponents = @(
'XATENTHT',
'XATENTLM',
'XATENTSR'
)

$Dcomponents = @(
'XABDSCH2',
'XABDBENC',
'XATRIAL'
)

$TIScomponents = @(
'XATENT'
)

$TRAcomponents = @(
'XABDSCH2',
'XABDBENC',
'XATRIAL'
)

$WEDcomponents = @(
'XATENT'
)


CopyEETComponents 'ARE' $AREcomponents
CopyEETComponents 'BAF' $BAFcomponents
CopyEETComponents 'BMP' $BMPcomponents
CopyEETComponents 'D' $Dcomponents
CopyEETComponents 'TIS' $TIScomponents
CopyEETComponents 'WED' $WEDcomponents
CopyTRAComponents 'ENGLISH' $TRAcomponents
