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

$2DAcomponents = @(
'XABAD1',
'XABAD2',
'XABAD3',
'XABG',
'XABGROM',
'XACAEEND',
'XACORND1',
'XACORND2',
'XACORND3',
'XACORND4',
'XACORND5',
'XACORND6',
'XADINNER',
'XADINROM',
'XALCAND1',
'XALCAND2',
'XALCAND3',
'XALCAND4',
'XALCAND5',
'XALCAND6',
'XASARA1',
'XASARA2',
'XASARA3',
'XASARA4'
)

$AREcomponents = @(

)

$BAFcomponents = @(
'XABALDUR',
'XALCJRNL'
)

$BAMcomponents = @(
'XAAMULET'
)

$BMPcomponents = @(
'XACORWIL',
'XACORWIM',
'XACORWIS',
'XANARZUS',
'XADINGSS'
)

$CREcomponents = @(
'XAADBG',
'XACORWIN'
)

$Dcomponents = @(
'XAAMISC'
'XALCASST'
)

$ITMcomponents = @(
'XAAMULET',
'XALTRSCH',
'XALTRCOR'
)

$MOScomponents = @(
'XAPTSARA',
'XABG',
'XADINNER',
'XABADEND'
)

$SPLcomponents = @(
'XALCARCH'
)

$TIScomponents = @(

)

$TRAcomponents = @(
'XAAMISC',
'XALCASST'
)

$WAVcomponents = @(
'XA100129',
'XA100128',
'XA100067',
'XA100127',
'XA100130',
'XA100065'
)

$WEDcomponents = @(
'XACLRG',
'XATENT'
)

CopyEETComponents '2DA' $2DAcomponents
CopyEETComponents 'ARE' $AREcomponents
CopyEETComponents 'BAF' $BAFcomponents
CopyEETComponents 'BAM' $BAMcomponents
CopyEETComponents 'BMP' $BMPcomponents
CopyEETComponents 'CRE' $CREcomponents
CopyEETComponents 'D' $Dcomponents
CopyEETComponents 'ITM' $ITMcomponents
CopyEETComponents 'MOS' $MOScomponents
CopyEETComponents 'SPL' $SPLcomponents
CopyEETComponents 'TIS' $TIScomponents
CopyEETComponents 'WAV' $WAVcomponents
CopyEETComponents 'WED' $WEDcomponents
CopyTRAComponents 'ENGLISH' $TRAcomponents

& "$(Split-Path $MyInvocation.MyCommand.Path)/makePkg.ps1"