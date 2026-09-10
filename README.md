# Homelab MCP APT repository

Dieses Repository enthält die signierten Debian-Pakete für Homelab MCP.

## Installation

Als root auf Debian 13:

```bash
curl -fsSL https://raw.githubusercontent.com/HerrBausW/homelab-mcp-apt/main/install.sh | bash
```

Die Ersteinrichtung erfolgt über die loopback-only Admin-Oberfläche. Der Administrator öffnet sie über einen eigenen SSH-Tunnel; ein generischer Root-Zugang für ChatGPT oder Automation wird nicht eingerichtet.

Danach werden Homelab-MCP-Updates normal über Debian eingespielt:

```bash
apt update
apt upgrade
```
