# Call.ps1

function Create-YearPath
{
    New-Item -ItemType Directory -Name $Year -Path $Year_Path
}

function Create-MonthPath
{
    New-Item -ItemType Directory -Name $Month -Path $Month_Path
}

function Create-DayPath
{
    New-Item -ItemType Directory -Name $Day -Path $Day_Path
}

if (!(Test-Path -Path ".\Calls"))    # Checking is the "Setup" script was executed already.
{
    Write-host "Please, run the 'Setup.exe' script first!"
    Start-Sleep -Seconds 5
    Exit
}

$File_Timestamp = $(Get-Date -Format "yyyy-MM-dd---HH-mm-ss") + ".txt"
$Year = Get-Date -Format "yyyy"
$Month = Get-Date -Format "MM"
$Day = Get-Date -Format "dd"

$Year_Path = $pwd.path + "\Calls"

if (!(Test-Path -Path $Year_Path))
{
    Create-YearPath
}

$Month_Path = $Year_Path + "\$Year"

if (!(Test-Path -Path $Month_Path))
{
    Create-MonthPath
}

$Day_Path = $Month_Path + "\$Month"

if (!(Test-Path -Path $Day_Path))
{
    Create-DayPath
}

$Current_Path = $Day_Path + "\$Day\"

$Message_Template = "First Name: `nLast Name: `nID: `nLocation: `nCallBack Number: `nProblem Description: "

New-Item -ItemType File -Name $File_Timestamp -Path $Current_Path -Value $Message_Template

Invoke-Item $($Current_Path + $File_Timestamp)
