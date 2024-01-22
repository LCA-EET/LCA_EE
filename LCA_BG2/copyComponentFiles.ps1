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
'XA4500',
'XA4700',
'XACS12'
)

$BAFcomponents = @(
'XA4500',
'XA4500T1',
'XA4500T2',
'XA4500T3',
'XA4700',
'XA4700T1',
'XABALDUR',
'XALCJRNL'
)

$BAMcomponents = @(
'XAAMULET',
'XAFLAM02',
'XAFLAM03',
'XAFLAM04'
)

$BMPcomponents = @(
'XA4500HT',
'XA4500LM',
'XA4500SR',
'XA4700HT',
'XA4700LM',
'XA4700SR',
'XACS12HT',
'XACS12LM',
'XACS12SR',
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
'XA4500',
'XA4700',
'XACS12'
)

$TRAcomponents = @(

)

$WAVcomponents = @(
'XABD4400',
'XABDLVA1'
)

$WBMcomponents = @(
'XA4700L1',
'XA4700L2',
'XA4700L3',
'XA4700L4'
)

$WEDcomponents = @(
'XA4500',
'XA4700',
'XACS12'
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
CopyEETComponents 'WBM' $WBMcomponents
CopyEETComponents 'WED' $WEDcomponents
CopyTRAComponents 'ENGLISH' $TRAcomponents

& "$(Split-Path $MyInvocation.MyCommand.Path)/makePkg.ps1"