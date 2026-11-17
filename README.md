**IT Helpdesk Automation Toolkit**



A PowerShell-based toolkit designed to automate common IT support and system administration diagnostic tasks.

Project Overview

This project provides practical scripts that help IT support technicians collect system information, monitor disk capacity, and troubleshoot basic network connectivity issues.

Features



**1. System Diagnostic**

File: Scripts/diagnostic.ps1



Retrieves computer name and current user.

Identifies Windows operating system and version.

Displays processor information.

Calculates installed physical RAM.

**2. Disk Diagnostic**



File: Scripts/disk-check.ps1

Detects local fixed disks.

Displays total, used, and free disk space.

Calculates free-space percentage.

Warns when available disk space falls below 15%.



**3. Network Diagnostic**



File: Scripts/network-diagnostic.ps1

Displays IP configuration.

Tests connectivity to a public IP address.

Checks DNS resolution.

Identifies the configured default gateway.



**Requirements**

Windows 10/11 or Windows Server.

Windows PowerShell 5.1 or later.

Appropriate permissions to access system information.



**Usage**

Open PowerShell in the project directory and execute:

.\\Scripts\\diagnostic.ps1

.\\Scripts\\disk-check.ps1

.\\Scripts\\network-diagnostic.ps1



**Project Structure**



IT-Helpdesk-Automation/

├── documentation/

├── reports/

├── screenshots/

├── Scripts/

│   ├── diagnostic.ps1

│   ├── disk-check.ps1

│   └── network-diagnostic.ps1

├── LICENSE

└── README.md



**Skills Demonstrated**



PowerShell scripting and automation

Windows system administration

Disk space monitoring

TCP/IP troubleshooting

DNS resolution

Network connectivity testing

Technical documentation

Project Status



Version 1.0 — Initial scripts implemented and tested.

Future improvements will include automated report generation, enhanced error handling, and additional diagnostic capabilities.





