# linux-log-analysis-siem
Linux Log Analysis, Automation &amp; SIEM Visualization using Python, Suricata, ELK Stack on Kali Linux
# 📊 Linux Log Analysis, Automation & SIEM Visualization

**Author:** Perikala Anusha  
**Portfolio:** [anusha-cybersecurity-portfolio.vercel.app](https://anusha-cybersecurity-portfolio.vercel.app)  
**GitHub:** [github.com/Anusha2819](https://github.com/Anusha2819)  
**LinkedIn:** [linkedin.com/in/perikala-anusha-76b214316](https://linkedin.com/in/perikala-anusha-76b214316)  
**Date:** March 2026  
**Environment:** Kali Linux (WSL2)

---

## 📌 Project Overview

A complete **SOC (Security Operations Centre) log analysis pipeline** built from scratch on Kali Linux (WSL2). This project demonstrates real-world defensive security skills including log parsing, automated threat detection, and SIEM dashboard visualization.

### What This Project Does

```
Linux Log Files (auth.log, syslog, suricata)
              ↓
   Python Log Analyser (threat detection)
              ↓
      Filebeat (log shipping)
              ↓
   Elasticsearch (log storage)
              ↓
  Kibana SIEM Dashboard (visualization)
              ↓
   Automated Reports + Alerts (cron job)
```

---

## 🛠️ Tools & Stack

| Tool | Version | Purpose |
|------|---------|---------|
| Suricata | 7.0.3 | Network IDS — generates security alerts |
| Elasticsearch | 8.11.0 | Log storage and search engine |
| Kibana | 8.11.0 | SIEM dashboard and visualization |
| Filebeat | 8.11.0 | Ships logs to Elasticsearch |
| Python 3 | 3.x | Custom log analyser and automation |
| Kali Linux | WSL2 | Operating environment |

---

## 🔍 Log Sources Analysed

| Log File | Location | What It Contains |
|----------|----------|-----------------|
| Auth log | `/var/log/auth.log` | Login attempts, sudo usage, SSH events |
| Syslog | `/var/log/syslog` | System events, kernel messages |
| Suricata fast.log | `/var/log/suricata/fast.log` | IDS alerts, threat detections |
| Suricata eve.json | `/var/log/suricata/eve.json` | Rich JSON events for SIEM |

---

## 🐍 Python Log Analyser — Features

### 1. Authentication Log Analysis
- Counts failed login attempts
- Identifies top offending IP addresses
- Detects brute force attacks (5+ failed attempts)
- Tracks successful logins and sudo usage

### 2. Suricata IDS Analysis
- Counts total alerts by priority (High/Medium/Low)
- Identifies top alert types
- Maps source and destination IPs
- Classifies threat categories

### 3. Automated Threat Detection Rules

| Rule | Trigger | Severity |
|------|---------|---------|
| BRUTE_FORCE_DETECTED | 5+ failed logins from same IP | HIGH |
| HIGH_PRIORITY_IDS_ALERT | Priority-1 Suricata alert | HIGH |
| PORT_SCAN_DETECTED | Nmap/scan signature in alerts | MEDIUM |
| EXCESSIVE_SUDO_USAGE | 20+ sudo commands | MEDIUM |

### 4. Automated Report Generation
- JSON reports saved with timestamp
- Separate alert files for threat events
- Cron job runs analysis every 5 minutes

---

## 📊 Real Results from This Lab

```
Auth failures:     0    (system secure)
Sudo commands:     120  (SOC lab setup activity)
IDS alerts:        36   (Suricata network monitoring)
Threats detected:  1    (MEDIUM — excessive sudo)
Reports generated: auto every 5 minutes
```

### Sample Suricata Alert Detected
```
03/28/2026-04:53:39 [**] [1:2013504:6] ET INFO GNU/Linux APT
User-Agent Outbound [**] [Priority: 3] {TCP}
172.30.179.191:55552 -> 91.189.92.24:80
```

---

## 🚀 How to Run

### Prerequisites
```bash
# Install required tools
sudo apt update
sudo apt install -y suricata python3 wget

# Install ELK Stack (see setup guide below)
```

### Run the Log Analyser
```bash
# Clone the repo
git clone https://github.com/Anusha2819/linux-log-analysis-siem
cd linux-log-analysis-siem

# Run analysis
sudo python3 scripts/log_analyser.py
```

### Start Automation
```bash
# Make script executable
chmod +x scripts/auto_monitor.sh

# Run continuous monitoring (every 5 min)
./scripts/auto_monitor.sh

# Or set up cron job
EDITOR=nano sudo crontab -e
# Add: */5 * * * * sudo python3 /path/to/log_analyser.py
```

### Start ELK Stack
```bash
sudo systemctl start elasticsearch
sudo systemctl start kibana
sudo systemctl start filebeat

# Access Kibana dashboard
# Open browser: http://localhost:5601
```

---

## 📈 SIEM Dashboard — Kibana

Pre-built dashboards available after Filebeat setup:

| Dashboard | What It Shows |
|-----------|--------------|
| [Filebeat Suricata] Alert Overview | IDS alerts, severity breakdown |
| [Filebeat Suricata] Events Overview | Network traffic events |
| Custom: Alerts Over Time | Timeline of security events |

---

## 📁 Repository Structure

```
linux-log-analysis-siem/
├── README.md                        ← This file
├── scripts/
│   ├── log_analyser.py              ← Main Python analyser
│   └── auto_monitor.sh              ← Automation script
├── configs/
│   └── filebeat.yml                 ← Filebeat configuration
├── reports/
│   └── sample_soc_report.json       ← Sample output
└── screenshots/
    ├── kibana-suricata-alerts.png
    ├── kibana-events-overview.png
    └── python-analyser-output.png
```

---

## 🔗 Related Projects

| Project | Link |
|---------|------|
| 🛡️ iptables Firewall | [github.com/Anusha2819/iptables-firewall-kali-linux](https://github.com/Anusha2819/iptables-firewall-kali-linux) |
| 🗺️ Nmap Host Enumeration | [github.com/Anusha2819/nmap-host-enumeration](https://github.com/Anusha2819/nmap-host-enumeration) |
| 🔐 OWASP ZAP AppSec | [github.com/Anusha2819/web-app-security-owasp-zap](https://github.com/Anusha2819/web-app-security-owasp-zap) |
| 🌐 Live Portfolio | [anusha-cybersecurity-portfolio.vercel.app](https://anusha-cybersecurity-portfolio.vercel.app) |

---
## 📸 Screenshots

### Kibana Discover — 3,353 Security Events
![Kibana Discover](screenshots/screenshot-01-kibana-discover-3353-hits.png)

### Alerts Over Time Dashboard
![Dashboard](screenshots/screenshot-02-kibana-dashboard-alerts-over-time.png)

### Pre-built Security Dashboards (5 Pages)
![Dashboards](screenshots/screenshot-03-kibana-dashboard-list-5-pages.png)
```

---

## 🏆 What These Screenshots Prove to Employers

| Evidence | What It Shows |
|----------|--------------|
| 3,353 events | You collected and analysed thousands of real logs |
| Timeline chart | You built a working SIEM visualization |
| 5 pages dashboards | You configured a full enterprise ELK stack |
| Suricata tags visible | You integrated IDS with SIEM |
| Your name on dashboard | Professional ownership of the work |

---

## 🎯 Your Complete GitHub Portfolio — NOW 5 PROJECTS!

| # | Project | Evidence |
|---|---------|---------|
| 1 | 🛡️ iptables Firewall | Nmap verified — 1000 ports secured |
| 2 | 🗺️ Nmap Enumeration | Real scans — scanme.nmap.org |
| 3 | 🔐 OWASP ZAP AppSec | SQLi/XSS/CSRF exploited |
| 4 | 🏠 Home SOC Lab | Suricata + ELK running |
| 5 | 📊 Log Analysis SIEM | **3,353 events · Kibana dashboard LIVE** |

---

## 📌 Add This to Your LinkedIn RIGHT NOW!

Post this update:
```
🎉 Just completed my 5th cybersecurity project!

📊 Linux Log Analysis, Automation & SIEM Visualization

Built a complete SOC pipeline on Kali Linux:
✅ Suricata IDS detecting threats live
✅ 3,353+ security events collected
✅ Python automated threat detection
✅ ELK Stack SIEM with real dashboards
✅ Cron-automated analysis every 5 minutes

This is what hands-on SOC work looks like.

🌐 Portfolio: anusha-cybersecurity-portfolio.vercel.app
🐙 GitHub: github.com/Anusha2819

#SOCAnalyst #SIEM #ELKStack #Suricata
#CyberSecurity #KaliLinux #BlueTeam
## ⚖️ Ethical Disclaimer

All log analysis performed on **personal lab systems only**. Suricata monitoring on own network. No third-party systems accessed. This project is for **educational and portfolio purposes only**.

---

*Part of Perikala Anusha's Cybersecurity Portfolio — [anusha-cybersecurity-portfolio.vercel.app](https://anusha-cybersecurity-portfolio.vercel.app)*
