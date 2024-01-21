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
'XACLRG',
'XATENT'
)

$BAFcomponents = @(
'XACLRG',
'XALBPRO1',
'XALBPRO2',
'XALBPRO3',
'XALBPROF',
'XATNTSCR',
'XABD0104',
'XABDCORW',
'XABD4400',
'XABD5300',
'XABD6000',
'XASDBALD',
'XASDJRNL'
)

$BMPcomponents = @(
'XACLRGHT',
'XACLRGLM',
'XACLRGSR',
'XATENTHT',
'XATENTLM',
'XATENTSR'
)

$CREcomponents = @(
'XABDSCH2'
)

$Dcomponents = @(
'XABDASHA',
'XABDSCH2',
'XABDBENC'
'XASDMISC',
'XASODCOR',
'XATRIAL'
)

$ITMcomponents = @(
'XALTRSCH',
'XALTRCOR',
'XAAMULET'
)

$SPLcomponents = @(
'XALCARCH'
)

$TIScomponents = @(
'XACLRG',
'XATENT'
)

$TRAcomponents = @(
'XABDASHA',
'XABDSCH2',
'XABDBENC',
'XALBPRO1',
'XALBPRO2',
'XASDMISC',
'XASODCOR',
'XATNTCS',
'XATRIAL',
'XASDJRNL'
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


CopyEETComponents 'ARE' $AREcomponents
CopyEETComponents 'BAF' $BAFcomponents
CopyEETComponents 'BMP' $BMPcomponents
CopyEETComponents 'CRE' $CREcomponents
CopyEETComponents 'D' $Dcomponents
CopyEETComponents 'ITM' $ITMcomponents
CopyEETComponents 'SPL' $SPLcomponents
CopyEETComponents 'TIS' $TIScomponents
CopyEETComponents 'WAV' $WAVcomponents
CopyEETComponents 'WED' $WEDcomponents
CopyTRAComponents 'ENGLISH' $TRAcomponents

& "$(Split-Path $MyInvocation.MyCommand.Path)/makePkg.ps1"