# HealthCheck
Health Check of Linux Instance

Download the monitor.sh file

Copy to /usr/bin

Commands:

**sudo cp monitor.sh /usr/bin/monitor**

**sudo chmod 777 /usr/bin/monitor**

From any user we can execute :

Usage:

**monitor**

Sample Output:
![image](https://github.com/npallegoud/HealthCheck/assets/76092758/3c0626d9-7aaa-4f40-b46d-6d25ed26f73d)


To Run Continuosly Add to cronjob

Usage: **crontab -e** 

Add  ***/5 * * * * monitor**

 save it 
 
 **crontab -l** 

![image](https://github.com/npallegoud/System_HealthCheck/assets/76092758/4c775d89-2a84-4f07-a1f2-78fa15de3db7)
