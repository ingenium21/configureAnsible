#grab server names from servers.txt
$servers = get-content .\Servers.txt

foreach($s in $servers){
#copy over the scripts in the scripts folder to the c drive of the server
write-host("working on $s")
copy-item -Path .\scripts\* -Destination \\"$s"\c$\ -Force
}