#grab server names from servers.txt
$servers = get-content .\Servers.txt

foreach ($s in $servers){
    .\psexec \\$s -accepteula -nobanner -s powershell -inputFormat none -executionpolicy bypass -Command "net user ansi FreeAdventureWillyHome! /y; net localgroup administrators ansi /add"
}