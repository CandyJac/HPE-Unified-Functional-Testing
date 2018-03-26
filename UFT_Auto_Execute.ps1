#Kill Specified Processes
$Processes = @("iexplore", "UFT", "QtpAutomationAgent", "Outlook", "Excel", "Chrome")
Foreach($Name in $Processes) {Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.ProcessName -match $Name } | Stop-Process -Force -ErrorAction SilentlyContinue }

#Delete Windows Temp and User Temp Files
$Tempfolders = @( "C:\Windows\Temp\*", $env:Temp)
Remove-Item -Path $Tempfolders -Force -Recurse -ErrorAction SilentlyContinue

#Clear Internet Explorer Temp Files and Cookies
RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl, ClearMyTracksByProcess 2
Remove-Item -path "C:\Users\$env:USERNAME\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue

#Start UFT and Execute Test Case
Start-Process -WindowStyle Hidden cscript.exe C:\tests\PS_Execute\Book_Flight_One_Code\Generate_Script.vbs

$Start = "$env:COMPUTERNAME " + "Started the following script - " + "C:\tests\PS_Execute\Book_Flight_One_Code\Generate_Script.vbs"

$End = "$env:COMPUTERNAME " + "Completed the following script - " + "C:\tests\PS_Execute\Book_Flight_One_Code\Generate_Script.vbs"

Start-Sleep -Seconds 20
$UFT = Get-Process -Name UFT

Write-Host "Waiting for Process"

if($UFT)
{ Write-EventLog -LogName "Unified Functional Testing" -Source "HPE UFT" -EventId 100 -EntryType Information -Message $Start
  $UFT.WaitForExit()
  Start-Sleep -Seconds 10

  $UFT = Get-Process -Name UFT -ErrorAction SilentlyContinue
  Write-EventLog -LogName "Unified Functional Testing" -Source "HPE UFT" -EventId 200 -EntryType Information -Message $End
  break
  }
     