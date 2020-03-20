# Speedtest Bash Script 
- Run continous speedtests using speedtest-cli and log the output to a csv file

## View Output
- Speeds are recorded in bit/s
- Divide by 1,000,000 to get megabits/s (mbps)
- `sed 's/, CA/ CA/; s/,,/, ,/' speedtest.csv | column -s, -t`


## Setup
*Setup the project to autorun on bootup:*
1. Clone Folder
2. `sudo apt-get install speedtest-cli`
3. `speedtest-cli --csv-header > "speedtest.csv"`
4. `sudo cp speedtest.service /etc/systemd/system/speedtest.service`
5. `rm speedtest.service`
6. Confirm it's working then enable it:
    1. `sudo systemctl start speedtest.service`
    2. `sudo systemctl stop speedtest.service`
    3. `sudo systemctl enable speedtest.service`
    - To disable `sudo systemctl disable speedtest.service`
    - Check status `systemctl status speedtest`
7. `sudo reboot now`