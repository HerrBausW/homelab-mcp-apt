# Homelab MCP APT repository

Dieses Repository enthält die signierten Debian-Pakete für Homelab MCP.

## Installation

Als root auf Debian 13:

```bash
curl -fsSL https://raw.githubusercontent.com/HerrBausW/homelab-mcp-apt/main/install.sh | bash
```

Die Ersteinrichtung erfolgt direkt über den Admin-Ingress im privaten Netzwerk unter . Dieser Zugang hat bewusst kein eigenes Passwort und zeigt einen deutlichen Warnhinweis. Der privilegierte Admin-Dienst auf Port 3001 bleibt loopback-only. Für externen Zugriff ist ein authentifizierter Reverse Proxy wie Cloudflare Access vorgesehen.

Danach werden Homelab-MCP-Updates normal über Debian eingespielt:

```bash
apt update
apt upgrade
```
