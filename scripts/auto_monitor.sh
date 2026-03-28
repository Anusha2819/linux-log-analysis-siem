#!/bin/bash
# ============================================================
# SOC Auto Monitor — Perikala Anusha
# Portfolio: anusha-cybersecurity-portfolio.vercel.app
# GitHub:    github.com/Anusha2819
# Date:      March 2026
# Purpose:   Runs log analysis every 5 minutes automatically
# ============================================================

LOG_FILE=~/log-analysis-project/reports/monitor.log
SCRIPT=~/log-analysis-project/scripts/log_analyser.py
ALERT_DIR=~/log-analysis-project/alerts

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   SOC AUTO MONITOR — PERIKALA ANUSHA                 ║"
echo "║   github.com/Anusha2819                              ║"
echo "║   Checking logs every 5 minutes...                   ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# Create directories if they don't exist
mkdir -p ~/log-analysis-project/reports
mkdir -p ~/log-analysis-project/alerts

# Check if analyser script exists
if [ ! -f "$SCRIPT" ]; then
    echo "[ERROR] Analyser script not found: $SCRIPT"
    exit 1
fi

# Check if Suricata is running
if ! pgrep -x suricata > /dev/null; then
    echo "[WARNING] Suricata is not running! Starting..."
    sudo suricata -c /etc/suricata/suricata.yaml -i eth0 -D
    sleep 3
fi

ITERATION=0

while true; do
    ITERATION=$((ITERATION + 1))
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "[$TIMESTAMP] Iteration #$ITERATION — Running analysis..."

    # Run the analyser
    sudo python3 $SCRIPT 2>&1 | tee -a $LOG_FILE

    # Check if any HIGH severity alerts were generated
    LATEST_ALERT=$(ls -t $ALERT_DIR/alerts_*.json 2>/dev/null | head -1)
    if [ -n "$LATEST_ALERT" ]; then
        HIGH_COUNT=$(grep -c '"severity": "HIGH"' "$LATEST_ALERT" 2>/dev/null || echo 0)
        if [ "$HIGH_COUNT" -gt 0 ]; then
            echo ""
            echo "⚠️  [$TIMESTAMP] HIGH SEVERITY ALERT DETECTED!"
            echo "    Alert file: $LATEST_ALERT"
            echo "    HIGH alerts: $HIGH_COUNT"
        fi
    fi

    echo "[$TIMESTAMP] Done. Next check in 5 minutes."
    echo ""

    sleep 300
done
