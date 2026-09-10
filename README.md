# Homelab MCP APT repository

Dieses Repository enthält die signierten Debian-Pakete für Homelab MCP.

## Installation

Als root auf Debian 13:

```bash
curl -fsSL https://raw.githubusercontent.com/HerrBausW/homelab-mcp-apt/main/install.sh | bash
```

Der Installer richtet Node.js 24, den signierten APT-Paketkanal und `homelab-mcp` ein. Am Ende wird die erkannte Server-IP zusammen mit der Admin-Adresse ausgegeben, zum Beispiel:

```text
Admin-Oberfläche: http://192.168.1.50:3101/admin/
```

Der privilegierte Admin-Dienst auf Port `3001` und der MCP-Dienst auf Port `3000` bleiben lokal gebunden. Port `3101` dient ausschließlich der Ersteinrichtung beziehungsweise einem abgesicherten Admin-Zugang.

## Nach der Installation

1. **Einrichtung** – Proxmox sowie weitere Linux-/SSH-Systeme oder MikroTik verbinden.
2. **Tools** – die nach System gruppierten Werkzeuge prüfen und Freigaben direkt in derselben Tabelle setzen.
3. **Sicherheit** – privaten Admin-Zugriff beibehalten oder auf Cloudflare Access/Tunnel beziehungsweise einen anderen Reverse Proxy beschränken.
4. Die **MCP-Shell** nur bei Bedarf aktivieren; sie läuft ausschließlich als unprivilegierter Benutzer `homelab-mcp`.
5. Optional Wiki und zusätzliche Tools einrichten oder importieren.

Der Bereich **Zugangsdaten** ist nur für Integrationen erforderlich, die ausdrücklich Tokens oder andere Geheimnisse benötigen. Für die normale Proxmox-SSH-Einrichtung ist dort nichts einzutragen. Home Assistant wird bewusst als eigener MCP behandelt und gehört nicht zum normalen Homelab-Ersteinrichtungsablauf.

## Updates

Wenn eine neue Version verfügbar ist, kann sie in der Admin-Oberfläche mit **Jetzt aktualisieren** installiert werden. Alternativ als root:

```bash
apt update
apt install --only-upgrade homelab-mcp
```

Konfiguration und Schlüssel unter `/etc/homelab-mcp/` sowie der Zustand unter `/var/lib/homelab-mcp/` bleiben bei Updates erhalten.

## Externer Zugriff

Port `3101` niemals direkt ins Internet veröffentlichen. Für externen Admin-Zugriff einen authentifizierten Reverse Proxy wie Cloudflare Access/Tunnel verwenden und dessen Quell-IP-Adressen anschließend unter **Sicherheit** eintragen. Auch Port `3000` darf nicht direkt veröffentlicht werden; externer MCP-Zugriff verwendet das vorgesehene OAuth-/Trusted-Proxy-Modell.
