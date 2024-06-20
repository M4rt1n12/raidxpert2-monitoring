# raidxpert2-monitoring
Monitoring raidxpert2 (for zabbix in my case)

1. Copy rc_diag-1.bat to "C:\Program Files (x86)\RAIDXpert2\

2. execute rc_diag-1.bat with Windows taskplanner every hour (elevated rights)

3. Add in zabbix_agent.conf:

UserParameter=checkraid,powershell.exe -file "C:\Scripte\checkraid.ps1"


Check filenames and

Have fun!
