# raidxpert2-monitoring
Monitoring raidxpert2 (for zabbix in my case)

1. Create a copy rc_diag-1.bat of "C:\Program Files (x86)\RAIDXpert2\rc_diag.bat

2. execute checkraid.ps1 with Windows taskplanner every hour

Check file name in the ps1 file and paths!


Add in zabbix_agent.conf:

UserParameter=checkraid,powershell.exe -file "C:\Scripte\checkraid.ps1"
