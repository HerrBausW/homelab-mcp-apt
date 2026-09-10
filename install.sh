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
printf 'Admin-Oberfläche lokal: http://127.0.0.1:3001/admin/\n'
printf '\nErsteinrichtung im privaten Netzwerk:\n'
printf '  Im Browser öffnen: http://<server-address>:3101/admin/\n'
printf '  Die Admin-Oberfläche ist dort zunächst ohne eigenes Passwort erreichbar.\n'
printf '  Der auffällige Warnhinweis muss bewusst bestätigt werden.\n'
printf '  Für externen Zugriff einen authentifizierten Reverse Proxy wie Cloudflare Access verwenden.\n'
printf '\nDer eigentliche Admin-Dienst auf Port 3001 bleibt nur lokal erreichbar.\n'
