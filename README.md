# Server Performance Monitoring Script

This repository contains `server-stats.sh`, a lightweight Bash script for monitoring essential server performance metrics. The script is designed to run on any Linux server and provides a snapshot of CPU usage, memory utilization, disk space, and the top processes by CPU and memory usage.

The script is ideal for sysadmins, developers, or anyone needing quick insights into server health without relying on heavy monitoring tools. It also includes an option to save output as a dated log file and set up a cron job for regular reporting.

---

## Features

- **CPU Usage**: Provides an overall CPU usage percentage.
- **Memory Usage**: Displays free and used memory, including usage percentage.
- **Disk Usage**: Reports used and free disk space with percentage utilization.
- **Top Processes by CPU**: Lists the top 5 processes by CPU usage.
- **Top Processes by Memory**: Lists the top 5 processes by memory usage.
- **Dated Log Files**: Saves output to a log file with a timestamp in the filename.
- **Cron Job Friendly**: Easily scheduled with `cron` for automated reporting.

---

## Getting Started

### 1. Clone the Repository

Clone this repository to your server:

```bash
git clone https://github.com/rfntnms/serverstats.git
cd server-performance-monitor
```

### 2. Set Up the Script

Open the script to specify the directory for saving log files:

```bash
nano server-stats.sh
```

At the top of the script, update the `report_dir` variable with the path to the directory where you’d like to save your reports:

```bash
report_dir="/path/to/report/directory"
```

Save and close the file.

### 3. Make the Script Executable

Give execution permissions to the script:

```bash
chmod +x server-stats.sh
```

### 4. Run the Script Manually

Run the script to check your server stats immediately:

```bash
./server-stats.sh
```

The output will be saved in the specified directory with a filename containing the current date and time, such as `server_stats_2024-11-11_00-00-00.log`.

---

## Automating the Script with Cron

To automate this script, add it to your crontab. This example sets it to run daily at midnight:

1. Open your crontab file:

   ```bash
   crontab -e
   ```

2. Add the following line:

   ```bash
   0 0 * * * /path/to/server-stats.sh
   ```

   Replace `/path/to/server-stats.sh` with the full path to the script.

3. Save and close the file. The script will now run daily and save a log file each time in the designated directory.

---

## Example Output

Each log file contains the following sections:

```
==================== SERVER STATS ====================
1. Total CPU Usage:
CPU Usage: 23.5%

2. Total Memory Usage:
Total Memory: 7982 MB
Used Memory: 5230 MB (65.52%)
Free Memory: 2752 MB

3. Total Disk Usage:
Disk Used: 40G
Disk Free: 100G
Disk Usage Percentage: 29%

4. Top 5 Processes by CPU Usage:
  PID   PPID CMD                         %MEM %CPU
  1234     1 /usr/bin/python3 myapp.py    1.3  25.5
  ...

5. Top 5 Processes by Memory Usage:
  PID   PPID CMD                         %MEM %CPU
  2345  1234 /usr/bin/mysqld              15.0 5.2
  ...
======================================================
```

---

https://roadmap.sh/projects/server-stats

## Contributing

Feel free to fork this repository and submit pull requests to add new features, improve performance, or expand compatibility.

---

## License

This project is licensed under the MIT License.

---

With this README, users will understand the purpose of the `server-stats.sh` script, how to set it up, and how to automate it for periodic monitoring.
