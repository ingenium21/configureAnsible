#grab server names from servers.txt
$servers = get-content .\servers.txt

foreach ($s in $servers){
    .\psexec \\$s -accepteula -nobanner -s powershell -inputFormat none -executionpolicy bypass -Command "choco install dotnet4.5 -y; choco install powershell -y"
}