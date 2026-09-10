#!/usr/bin/env bash
set -euo pipefail

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
  echo 'Bitte als root ausführen.' >&2
  exit 1
fi

BASE_URL='https://raw.githubusercontent.com/HerrBausW/homelab-mcp-apt/main'
KEYRING=/usr/share/keyrings/homelab-mcp-archive-keyring.gpg
SOURCE=/etc/apt/sources.list.d/homelab-mcp.list

apt-get update
apt-get install -y ca-certificates curl gnupg
install -d -m 0755 /etc/apt/keyrings
curl --fail --silent --show-error --location 'https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key' | gpg --dearmor --yes -o /etc/apt/keyrings/nodesource.gpg
printf 'deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_24.x nodistro main\n' > /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install -y nodejs
node_major=$(node -p "process.versions.node.split('.')[0]")
if [[ "$node_major" -lt 24 ]]; then echo 'Node.js 24 oder neuer ist erforderlich.' >&2; exit 1; fi
curl --fail --silent --show-error --location "$BASE_URL/homelab-mcp-archive-keyring.gpg" -o "$KEYRING"
chmod 0644 "$KEYRING"
printf 'deb [signed-by=%s] %s stable main\n' "$KEYRING" "$BASE_URL" > "$SOURCE"
apt-get update
apt-get install -y homelab-mcp

printf '\nHomelab MCP ist installiert.\n'
printf 'Admin-Dienst lokal: http://127.0.0.1:3001/admin/\n'
printf 'MCP-Dienst lokal:   http://127.0.0.1:3000/mcp\n'
server_ip=$(hostname -I 2>/dev/null | awk '{ for (i = 1; i <= NF; i++) if ($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) { print $i; exit } }')
printf '\nErsteinrichtung im privaten Netzwerk:\n'
if [[ -n "$server_ip" ]]; then
  printf '  Admin-Oberfläche: http://%s:3101/admin/\n' "$server_ip"
else
  printf '  Admin-Oberfläche: http://<server-ip>:3101/admin/\n'
fi
printf '\nDanach in der Oberfläche:\n'
printf '  1. Einrichtung: Proxmox und weitere Linux-/SSH-Systeme oder MikroTik verbinden.\n'
printf '  2. Tools: Werkzeuge pro System prüfen und Freigaben direkt in der Tabelle setzen.\n'
printf '  3. Sicherheit: privaten Admin-Zugriff beibehalten oder auf Cloudflare/Reverse Proxy beschränken.\n'
printf '  4. MCP-Shell nur bei Bedarf unter Sicherheit aktivieren.\n'
printf '  5. Optional Wiki und zusätzliche Tools einrichten oder importieren.\n'
printf '\nHinweise:\n'
printf '  - Port 3001 und der MCP auf Port 3000 bleiben lokal gebunden.\n'
printf '  - Port 3101 dient der Ersteinrichtung im privaten Netzwerk.\n'
printf '  - Port 3101 niemals direkt ins Internet veröffentlichen.\n'
printf '  - Für externen Admin-Zugriff einen authentifizierten Reverse Proxy verwenden.\n'
printf '  - Zugangsdaten sind nur nötig, wenn eine Integration ausdrücklich ein Token/Secret benötigt.\n'
printf '  - Home Assistant wird als separater MCP betrieben und gehört nicht zum normalen Homelab-Setup.\n'
printf '  - Updates können später über „Jetzt aktualisieren“ oder per APT eingespielt werden.\n'
