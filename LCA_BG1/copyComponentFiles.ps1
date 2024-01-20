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

$BAFcomponents = @(
'XA1316FP',
'XA1317DS',
'XABG1317',
'XAADBG'
)

$CREcomponents = @(
'XAADBG'
)

$Dcomponents = @(
'XAADBG'
)

$ITMcomponents = @(
'XAFFBOOK',
'XAAMBELT',
'XALTRBRN'
)


$TRAcomponents = @(
'XAADBG'
)

CopyEETComponents 'BAF' $BAFcomponents
CopyEETComponents 'CRE' $CREcomponents
CopyEETComponents 'D' $Dcomponents
CopyEETComponents 'ITM' $ITMcomponents

CopyTRAComponents 'ENGLISH' $TRAcomponents
