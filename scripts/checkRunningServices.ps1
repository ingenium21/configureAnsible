#check services that are set to automatic and are not running
$services = get-CimInstance -className win32_service -filter "startmode = 'auto' AND state != 'running' "

if($services -eq $null) {
	#if all auto services are running 
	write-host "services are all started"
	stop-process $PID
}

else {
	#while $services isn't null start the services, requery the services and then exit.
		foreach ($s in $service) {
			get-service $s.name | start-service
		}
	write-host "services were restarted successfully"
	Stop-Process $PID
}