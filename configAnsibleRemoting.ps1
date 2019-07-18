#grab server names from servers.txt
$servers = get-content .\servers.txt

foreach ($s in $servers){
	Try {
        .\psexec \\$s -accepteula -nobanner -s powershell -inputFormat none -executionpolicy bypass -Command "iwr https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -UseBasicParsing | iex"
	}
    Catch {
        $s | Out-File .\ExceptedServers.txt -Append
    }
}