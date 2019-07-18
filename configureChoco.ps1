#grab server names from servers.txt
$servers = get-content .\servers.txt

foreach ($s in $servers){
    .\psexec \\$s -accepteula -nobanner -s powershell -inputFormat none -executionpolicy bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
}