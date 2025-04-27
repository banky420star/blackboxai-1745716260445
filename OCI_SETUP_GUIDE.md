# Oracle Cloud Infrastructure (OCI) Setup Guide for Trading Bot

This guide will help you deploy and run the advanced LSTM and Deep Reinforcement Learning trading bot on an OCI Ubuntu 20.04+ VM instance.

---

## 1. Prerequisites

- An OCI account with a running Ubuntu 20.04 or later VM instance.
- SSH access to the VM.
- Basic familiarity with Linux command line.

---

## 2. Connect to Your OCI VM

Use your terminal or SSH client:

```bash
ssh -i /path/to/your/private_key opc@your_vm_public_ip
```

Replace `/path/to/your/private_key` and `your_vm_public_ip` accordingly.

---

## 3. Update and Upgrade System

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 4. Clone the Trading Bot Repository

```bash
git clone https://github.com/yourusername/your-trading-bot-repo.git /opt/trading_bot
cd /opt/trading_bot
```

Replace with your actual repository URL.

---

## 5. Run Setup Scripts

### 5.1 VPS Setup

```bash
bash scripts/setup_vps.sh
```

This will install system dependencies, create a Python virtual environment, and install Python packages.

### 5.2 Security Setup

```bash
bash scripts/security_setup.sh
```

This will configure firewall, SSH hardening, and security monitoring.

---

## 6. Configure API Keys

- Use the secure secrets file created by the security setup script:

```bash
sudo nano /opt/trading_bot/secrets/api_keys.env
```

- Add your API keys:

```
EXCHANGE_API_KEY=your_alpaca_api_key
EXCHANGE_SECRET_KEY=your_alpaca_api_secret
NEWS_API_KEY=your_news_api_key
```

- Save and exit.

---

## 7. Activate Environment and Run Bot

```bash
source /opt/trading_bot/venv/bin/activate
python3 /opt/trading_bot/src/main.py
```

---

## 8. Manage the Bot

- Use the management script for monitoring, backups, and restarts:

```bash
python3 /opt/trading_bot/scripts/manage_vps.py --check
python3 /opt/trading_bot/scripts/manage_vps.py --backup
python3 /opt/trading_bot/scripts/manage_vps.py --restart
```

- Logs are located at `/var/log/trading_bot/`.

---

## 9. Optional: Frontend Dashboard

- The frontend dashboard is a static HTML file located at `/opt/trading_bot/frontend/index.html`.
- You can serve it using a simple HTTP server:

```bash
cd /opt/trading_bot/frontend
python3 -m http.server 8000
```

- Access it via `http://your_vm_public_ip:8000` in your browser.

---

## 10. Notes

- Ensure your VM has at least 8GB RAM and 4 CPU cores for optimal performance.
- Adjust firewall rules if you want to expose the frontend or API ports.
- Regularly update your system and dependencies.

---

If you need further assistance with any step, please let me know.
