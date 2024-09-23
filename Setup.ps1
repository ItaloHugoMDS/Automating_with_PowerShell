# Setup.ps1

$Year = Get-Date -Format "yyyy"
$Month = Get-Date -Format "MM"
$Day = Get-Date -Format "dd"

$Current_Path = $pwd.path

New-Item -ItemType Directory -Name "Calls" -Path $Current_Path

$Call_Path = $Current_Path + "\Calls\"

New-Item -ItemType Directory -Name $Year -Path $Call_Path

$Year_Path = $Call_Path + "$Year\"

New-Item -ItemType Directory -Name $Month -Path $Year_Path

$Month_Path = $Year_Path + "$Month\"

New-Item -ItemType Directory -Name $Day -Path $Month_Path
