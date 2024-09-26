# Call.ps1

function Create-YearPath
{
    Write-Host "Entered the Create-YearPath function"
    New-Item -ItemType Directory -Name $Year -Path $Root_Path
}

function Create-MonthPath
{
    Write-Host "Entered the Create-MonthPath function"
    New-Item -ItemType Directory -Name $Month -Path $Year_Path
}

function Create-DayPath
{
    Write-Host "Entered the Create-DayPath function"
    New-Item -ItemType Directory -Name $Day -Path $Month_Path
}

if (!(Test-Path -Path ".\Calls"))    # Checking is the "Setup" script was executed already.
{
    Write-host "Please, run the 'Setup.exe' script first!"
    Start-Sleep -Seconds 5
    Exit
}

function Main
{
    $File_Timestamp = $(Get-Date -Format "yyyy-MM-dd---HH-mm-ss") + ".txt"
    $Year = Get-Date -Format "yyyy"
    $Month = Get-Date -Format "MM"
    $Day = Get-Date -Format "dd"
    
    $Root_Path = "{0}\{1}" -f $pwd.path, "Calls"
    $Year_Path = "{0}\{1}\{2}" -f $pwd.path, "Calls", $Year
    $Month_Path = "{0}\{1}\{2}\{3}" -f $pwd.path, "Calls", $Year, $Month
    $Day_Path = "{0}\{1}\{2}\{3}\{4}" -f $pwd.path, "Calls", $Year, $Month, $Day
    $Current_Path = "{0}\{1}\{2}\{3}\{4}\" -f $pwd.path, "Calls", $Year, $Month, $Day
    
    if (!(Test-Path -Path $Year_Path))
    {
        Create-YearPath
    }
    
    if (!(Test-Path -Path $Month_Path))
    {
        Create-MonthPath
    }
    
    if (!(Test-Path -Path $Day_Path))
    {
        Create-DayPath
    }
    
    $Message_Template = "First Name: `nLast Name: `nID: `nLocation: `nCallBack Number: `nProblem Description: "
    
    New-Item -ItemType File -Name $File_Timestamp -Path $Current_Path -Value $Message_Template
    
    Invoke-Item $($Current_Path + $File_Timestamp)

}

Main
