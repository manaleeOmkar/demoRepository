logFile="system_report.log"

{
	echo "System report"
	echo "Hostname: $(hostname)"
	echo "Uptime: $(uptime -p)"
	echo "Disk Usage: "
	df -h
	echo "Memory usage"
	free -h
} &> "$logFile"

echo "Report save to $logfile"

read -p "Are you want to read file (y/n):- " a

if [[ $a == "Y" || $a == "y" ]]; then 
	cat "$logFile"
fi

read -p "Are you sure you want to run 'htop' and store its details? (y/n): " ht
if [[ $ht == "y" || $ht == "Y" ]]; then
	top -b -n 1 &>> "$logFile"

	read -p "Do you want to view the htop snapshot? (y/n): " vt
	if [[ $vt == "y" || $vt == "Y" ]]; then
		cat "$logFile"
	fi
else
	exit  1
fi
