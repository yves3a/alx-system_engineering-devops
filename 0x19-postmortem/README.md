0x19-postmortem
Description:
This is a postmortem of the issues I faced during a project implementation.


Postmortem: Inventory Management System Outage
Issue Summary:
Duration: October 30, 2023
Impact:
Service Affected: Web-based Inventory Management System (Under Development)
User Experience: I was unable to access the data on the interface. I couldn’t add items in the database.
Root Cause: Database Corruption due to Unforeseen MySQL Issue

Timeline:
Detection Time: October 30, 2023, [Time of detection]
Detection Method: Discovered the issue during routine usage of the system interface.
Actions Taken:
- Investigated server logs for anomalies.
- Assumed Root Cause: Initially suspected a network issue impacting database connectivity.
- Checked server resources and connectivity.
- Assumed Root Cause: Database server load was within normal limits.
- Investigated MySQL logs for errors.
- Unable to access MySQL as root or other users.
- Attempted safe mode access and user recreation without success.
Misleading Paths:
- Explored Network Connectivity Issues - ruled out after investigation.
- Explored High Server Load - not the cause.
- Explored MySQL Safe Mode for User Recreation - unsuccessful.

Resolution:
Identified and rectified a corrupted database table.
Applied necessary fixes to MySQL configuration.
Restored the system from the last available backup.
MySQL was uninstalled and reinstalled on the Ubuntu 23 droplet.
Recreated two databases, tables, and users.
Granted user privileges and added missing columns.
Resolution Time: Approximately three hours.

Root Cause and Resolution:
Root Cause:
The primary cause was identified as a corruption in a key database table, likely due to an unexpected MySQL glitch.
Resolution:
The corrupted table was repaired through MySQL tools.
Configuration adjustments were made to prevent a recurrence.
A full system restore was performed from the most recent backup.
MySQL was uninstalled and reinstalled on the Ubuntu 23 droplet.
Databases, tables, and users were recreated, and missing columns added.

Backup Implementation:
Backups were scheduled every two days using a cron job and a bash script.
This script captures the current date, sets the database name, defines the backup path, and then uses mysqldump to create a dump file. Finally, it compresses the dump using tar.

To make the script executable, run:
chmod +x stock_backup.sh

The cron job executes the stock_backup.sh Bash script every two days at midnight. This script creates a MySQL database dump and saves it in a backup directory. The execution output, along with any errors, is appended to a log file (cron_log.txt).

Corrective and Preventative Measures:
Improvements/Fixes:
Implement regular database health checks in the monitoring system.
Establish a more robust backup and recovery strategy.
Perform backups every two days.
Consider implementing database version control for schema changes.
Implement an automated backup script and directory creation.
Create a MySQL database replica on another server.

Tasks:
TODO: Schedule regular database maintenance to address potential issues proactively.
TODO: Review and update backup procedures to ensure quick system recovery.
TODO: Monitor and improve database replication for real-time backup.
TODO: Conduct regular drills to test the effectiveness of the backup and recovery process.