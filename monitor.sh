#! /bin/bash
# unset any variable which system may be using

# clear the screen
clear

if [[ $# -eq 0 ]]
then
{


# Check RAM and SWAP Usages
echo "---------------------------"
free -h | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages :" $tecreset
echo "---------------------------"
cat /tmp/ramcache | grep -v "Swap"

# Check Disk Usages
echo "---------------------------"
df -h > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :" $tecreset
echo "---------------------------"
cat /tmp/diskusage


#Running processes
echo "---------------------------"
echo "Top Running Processes ....."
echo "---------------------------"

loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e "${cyan}Load average:${NC}: $loadaverage"
echo -e "${cyan}The top 10 services with high resource usage are listed below.${NC}"
#Get top services with high resource utilization
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head



#Check CPU Usage
echo "------------------------------"
echo "CPU USAGE"
echo "------------------------------"
top -b -n 1 |head -8 >/tmp/cpu.text
cat /tmp/cpu.text
sed -e '1,5d' /tmp/cpu.text >/tmp/cpu2.text
High_CPU=`cat /tmp/cpu2.text|tail -1|awk '{print $9}'`
High_CPU=${High_CPU%.*}
echo $High_CPU
host=`hostname`
echo "---------------------------"
if [ $High_CPU -gt 80 ]
then
  current_time=$(date +"%Y%m%d%T")
  echo  "High CPU USAGE on $host instance $High_CPU" > /tmp/cpu-log-${current_time}.log
  cat /tmp/cpu-log-$current_time.log
else
  echo "CPU Utilisation is Normal"
fi
echo "---------------------------"
exit;
}
fi
shift $(($OPTIND -1))
