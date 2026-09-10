# Homelab MCP APT repository

Dieses Repository enthält die signierten Debian-Pakete für Homelab MCP.

## Installation

Als root auf Debian 13:

```bash
curl -fsSL https://raw.githubusercontent.com/HerrBausW/homelab-mcp-apt/main/install.sh | bash
```

Danach werden Homelab-MCP-Updates normal über Debian eingespielt:

```bash
apt update
apt upgrade
```
