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
'XALCASST',
'XABG1317',
'XAADBG'
)

$BAMcomponents = @(
'XAASSIST'
)

$CREcomponents = @(
'XAADBG'
)

$Dcomponents = @(
'XALCASST'
)

$ITMcomponents = @(
'XAFFBOOK',
'XAAMBELT',
'XALTRBRN'
)

$SPLcomponents = @(
'XAASSIS1'
)



$TRAcomponents = @(
'XALCASST'
'XAADBG'
)

CopyEETComponents 'BAF' $BAFcomponents
CopyEETComponents 'BAM' $BAMcomponents
CopyEETComponents 'CRE' $CREcomponents
CopyEETComponents 'D' $Dcomponents
CopyEETComponents 'ITM' $ITMcomponents
CopyEETComponents 'SPL' $SPLcomponents

CopyTRAComponents 'ENGLISH' $TRAcomponents
