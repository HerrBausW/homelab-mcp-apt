# Changelog

## 0.6.10

- Behebt einen APT-Upgradefehler, durch den der eingeschränkte MCP-Ingress nach einem Update deaktiviert bleiben konnte, obwohl in der Sicherheitskonfiguration weiterhin Proxy-Betrieb mit öffentlichem Host aktiviert war.
- Der Paketinstaller stellt den MCP-Ingress jetzt anhand der persistierten Proxy-Konfiguration wieder her; dadurch bleibt der öffentliche MCP-Endpunkt für externe MCP-Clients erreichbar.

## 0.6.9

- Korrigiert die UI-Regressionstests für die wiederhergestellte gruppierte Werkzeugansicht mit Suche, Filter und Freigabeschaltern.
- Die vollständige Testsuite läuft mit dem neuen Werkzeuglayout wieder erfolgreich durch.

## 0.6.8

- Die Werkzeugverwaltung verwendet wieder den vertrauten Aufbau des bisherigen MCP-Dashboards: eine große Werkzeugkarte mit Suche, Freigabefilter, einklappbaren Systemgruppen, Risikobadges und Freigabeschaltern direkt in jeder Tool-Zeile.
- Die neuen v2-Funktionen bleiben integriert: zusätzliche Tools, Vorlagen bearbeiten, Import/Export, portable Exporte und der Tool-Assistent sind weiterhin verfügbar.
- Die Reiter-Navigation der neuen Admin-Oberfläche bleibt erhalten.

## 0.6.7

- Die Admin-Oberfläche übernimmt wieder die ruhigere, hellere Gestaltung des bisherigen MCP-Dashboards mit kompakterer Navigation, großzügigerer Typografie und flacheren Karten, behält aber die neuen Reiter bei.
- Die Versionsanzeige bleibt anklickbar und zeigt weiterhin die letzten Änderungen sowie bei verfügbarem Update dessen Versionshinweise hervorgehoben an.

## 0.6.6

- Ein Klick auf die Versionsanzeige öffnet jetzt einen kompakten Versionsverlauf; bei verfügbarem Update werden dessen Änderungen hervorgehoben vor den zuletzt installierten Versionen angezeigt.

## 0.6.5

- `/admin` leitet jetzt auf `/admin/` um, sodass die Admin-Oberfläche auch ohne abschließenden Slash funktioniert.
- Beim Aktivieren des abgesicherten Reverse-Proxy-Modus wird der MCP-Ingress auf Port 3100 mit Proxy-IP und öffentlichem Hostnamen automatisch konfiguriert und gestartet; beim Wechsel zurück ins private Netz wird er wieder deaktiviert.
## 0.6.4

- Die Reverse-Proxy-Einrichtung kennzeichnet die Proxy-IP sichtbar als Pflichtfeld und meldet fehlende Proxy-IP-Adressen auf Deutsch.
- Linux-/ebusd-Vorlagenwerkzeuge sind jetzt pro SSH-Ziel bearbeitbar; bestehende Linux-Ziele erhalten die editierbaren Standardbefehle beim Start automatisch nachgetragen.
## 0.6.3

- Der Warnhinweis für ungeschützten Admin-Zugriff ist nicht mehr als vollbreiter roter Banner ausgeführt, sondern als kompakte Warnkarte im normalen Seitenlayout.
- Der globale Hinweisbanner wurde optisch in die Karten-/Panel-Sprache der Admin-Oberfläche integriert und wirkt nicht mehr wie ein separater blauer Systembanner.
- Nach erfolgreichem Speichern eines zusätzlichen SSH-Ziels wird die Eingabemaske geleert und die erweiterte Einrichtung wieder eingeklappt.
- Die Kopierbuttons für SSH-/Proxmox-Bootstrap-Befehle verwenden jetzt einen Clipboard-Fallback für unverschlüsselte lokale Admin-Seiten und sind als kompakte Code-Kopierbuttons gestaltet.

## 0.6.2

- Entfernt die redundante Karte „Laufzeitsicherheit“ aus der Sicherheitsseite; Shell, Tool-Entwicklung und Admin-Zugriff stehen dort bereits in ihren eigenen Bereichen.
- Das öffentliche APT-Repository veröffentlicht ab jetzt die kanonische `CHANGELOG.md` aus dem Quellrepository und verlinkt sie im README.
- Ergänzt die bislang fehlenden Einträge für alle tatsächlich veröffentlichten frühen Releases 0.5.1 bis 0.5.13. Nicht veröffentlichte Versionsnummern werden nicht künstlich aufgeführt.

## 0.6.1

- Die Laufzeitsicherheitsanzeige verwendet jetzt die tatsächlichen Zustände der MCP-Shell und der Tool-Entwicklung statt des statischen internen Felds `genericShellExposed`.
- Nach Aktivieren oder Deaktivieren werden beide Zustände sofort korrekt in der Übersicht und unter Sicherheit angezeigt.

## 0.6.0

- Führt einen ausdrücklich vom menschlichen Administrator aktivierbaren Tool-Entwicklungsmodus ein.
- Im Entwicklungsmodus kann ein MCP-Client vorhandene SSH-Ziele auflisten, Testbefehle mit den bereits konfigurierten eingeschränkten SSH-Benutzern ausführen, Tooldefinitionen validieren, speichern, löschen und den Tool-Katalog neu laden.
- Der Entwicklungsmodus kann keine neuen Hosts anlegen und gewährt keinen Root-Login; alle Entwicklungsaufrufe laufen weiterhin durch das Audit-System.
- Die Admin-Oberfläche zeigt den Modus unter Sicherheit deutlich an und aktiviert/deaktiviert die zugehörigen `dev_*`-Tools als eigene Plugin-Oberfläche.

## 0.5.32

- Normale Hinweis- und Erfolgsmeldungen in der Admin-Oberfläche verschwinden jetzt nach sechs Sekunden automatisch.
- Fehlermeldungen bleiben weiterhin sichtbar, bis sie durch eine neue Aktion ersetzt oder bewusst geleert werden.

## 0.5.31

- Behebt das Aktivieren der MCP-Shell unter der gehärteten Admin-Unit: Das Shell-Gate-Verzeichnis ist jetzt root-owned und für den unprivilegierten MCP-Dienst nur lesbar/traversierbar.
- Paket-Upgrades reparieren die Verzeichnisrechte automatisch, sodass bestehende Installationen keinen manuellen chmod/chown benötigen.

## 0.5.30

- Behebt fehlgeschlagene Sicherheitsänderungen wie das Aktivieren der MCP-Shell: Die Audit-Kategorien `security` und `backup` werden jetzt vom Audit-System akzeptiert.
- Die Admin-Oberfläche zeigt bei einem echten Audit-Ausfall eine verständliche Meldung statt des internen Codes `audit_unavailable`.

## 0.5.29

- Entfernt Home-Assistant-Hinweise aus dem öffentlichen Installer, dem APT-README und dem normalen Ersteinrichtungsablauf. Home Assistant bleibt außerhalb der Homelab-MCP-Ersteinrichtung.

## 0.5.28

- Entfernt einen verbliebenen doppelten README-Block aus dem APT-Repository-Generator, der nach dem korrekten Heredoc weiterhin als Shell-Befehle ausgeführt wurde.
- Ergänzt einen Regressionstest, der genau einen README-Generatorblock und genau einen Heredoc-Abschluss erzwingt.

## 0.5.27

- Behebt die Veröffentlichung des öffentlichen APT-Repositories: Markdown-Code-Markierungen im generierten README werden nicht mehr vom Build-Shell interpretiert.
- Die öffentliche Installationsanleitung kann damit wieder zusammen mit dem signierten Debian-Paket veröffentlicht werden.

## 0.5.26

- Der öffentliche APT-Installer zeigt nach der Installation die erkannte Server-IP und einen vollständigen aktuellen Ersteinrichtungsablauf an.
- Das automatisch erzeugte öffentliche APT-README beschreibt Einrichtung, Tools/Freigaben, Sicherheit, Shell, Updates und die Trennung von Home Assistant korrekt.
- Installations-, First-Run- und APT-Dokumentation wurden auf denselben Ablauf vereinheitlicht.

## 0.5.25

- Behebt den APT-Selbstupdate-Dienst unter systemd-Härtung: APT verwendet im fest begrenzten Root-Updater keinen zusätzlichen `_apt`-UID-Wechsel mehr, der durch die Unit-Sandbox blockiert wurde.
- Die Oberfläche überwacht den tatsächlichen Update-Dienst und meldet einen fehlgeschlagenen APT-Lauf, statt nach dem Start pauschal neu zu laden.

## 0.5.24

- Funktionsumfang des bisherigen MCP v1 wird in die neue Architektur zurückgeführt: lokale Shell mit Admin-Gate, Infrastruktur-/Ping-/Audit-Tools, Linux-SSH-Wartung und Dateiwerkzeuge sowie MikroTik RouterOS.
- Proxmox erhält wieder Dienstestatus, Dienstneustart, Journal lesen und Journal bereinigen über den eingeschränkten mcp-pct-Wrapper.
- Linux-SSH-Ziele unterstützen optionale Schreibpfad-Allowlisten; Schreibzugriffe bleiben ohne explizite Freigabe gesperrt.
- MikroTik verwendet einen eigenen RouterOS-SSH-Ausführungspfad statt POSIX-Command-Quoting.
- Bestehende Installationen mit bereits eingerichteten SSH-Zielen erhalten die neuen read-only Linux-Werkzeuge einmalig automatisch aktiviert; eine spätere bewusste Deaktivierung wird respektiert.
- Die Shell lässt sich unter Sicherheit ein- und ausschalten und läuft ausschließlich als unprivilegierter homelab-mcp-Benutzer.

## 0.5.23

- Die Tool-Ansicht zeigt neben SSH-Zielen auch die übrigen eingebauten Systeme als eigene Gruppen; Home Assistant bleibt bewusst ausgeblendet.
- Der APT-Update-Button kann Homelab MCP jetzt direkt aus der Oberfläche über einen festen privilegierten systemd-Updater aktualisieren.
- Der MCP-Laufzeitbenutzer erhält dafür keine Shell- oder sudo-Rechte.
- Die generische Eingabe „Geschützte Werte“ wurde als erweiterter Bereich „Zugangsdaten“ zurückgestuft und erklärt ihren Zweck.

## 0.5.22

- Tools werden nach System gruppiert; „+ Tool“ erscheint nur noch einmal pro System.
- Vorlagen-Tools mit deklarativem SSH-Befehl können direkt bearbeitet werden.
- Sicherheit enthält jetzt eine echte Admin-Zugriffskonfiguration für privates Netz, Cloudflare Access/Tunnel oder andere Reverse Proxies.
- Bei Reverse-Proxy-Modus wird Port 3101 serverseitig auf die angegebenen Proxy-IP-Adressen beschränkt; der Warnbanner richtet sich nach diesem Status.

## 0.5.21

- Systeme, Tools und Freigaben stehen jetzt in einer einzigen Tabelle statt in zwei getrennten Listen.
- Jede Tool-Zeile zeigt System, Herkunft, Risiko und effektive Freigabe.
- Zusätzliche Tools lassen sich direkt bearbeiten; bei Vorlagen kann direkt ein weiteres Tool für dasselbe System angelegt werden.

## 0.5.20

- Behebt einen JavaScript-Fehler nach dem Zusammenführen der Tool-Ansicht: ein entfernter Legacy-Container wird nicht mehr vorausgesetzt.

## 0.5.19

- Tools und Freigaben wurden in einer gemeinsamen Ansicht zusammengeführt.
- Systeme zeigen ihre Vorlagen-Tools und können über „+ Tool“ direkt erweitert werden.
- Portable Exporte lassen sich nach System auswählen.
- Zusätzlich gibt es ein verschlüsseltes Vollbackup mit privaten SSH-/Wiki-Schlüsseln und geschützten Werten.
- Audit-Protokoll ist jetzt Teil von Sicherheit; die technische Konfigurationsansicht wurde aus der Navigation entfernt.
- Interne Home-Assistant- und System-Plugins werden in den normalen Freigaben ausgeblendet.

## 0.5.18

- SSH-Ziele sind jetzt Systeme, die sowohl von Vorlagen als auch von zusätzlichen Tools gemeinsam genutzt werden können.
- Proxmox und andere vorkonfigurierte Ziele erscheinen im Tool-Assistenten und können um eigene Tools erweitert werden.
- Der Bereich „Eigene Tools“ heißt vereinfacht „Tools“.
- Beim ersten eigenen Tool wird die Tool-Funktion automatisch aktiviert; Freigaben bleiben weiterhin standardmäßig gesperrt.

## 0.5.17

- Eigene Tools können als portables JSON-Paket exportiert und wieder importiert werden.
- Übersicht und Versionsinformationen wurden zusammengeführt; der separate Reiter „Versionen“ entfällt.
- APT-Installationen prüfen im Portal die veröffentlichte Version und zeigen verfügbare Updates an.
- Die Übersicht zeigt die Versionshinweise der aktuell veröffentlichten Version.

## 0.5.16

- Tool-Freigaben werden nach Lesen, Schreiben und Destruktiv gruppiert.

## 0.5.15

- Plugins und Tool-Freigaben wurden zu „Funktionen & Freigaben“ zusammengeführt.
- Die Proxmox-Einrichtung ist einklappbar und erklärt den Root-Befehl vor der Ausführung.

## 0.5.14

- Die Einrichtungsseite wurde vereinfacht und optisch überarbeitet.

## 0.5.13

- Die geführte Proxmox-Einrichtung verwendet einen bereits erzeugten SSH-Schlüssel weiter, statt bei jedem Durchlauf einen neuen zu erzeugen.

## 0.5.12

- Das öffentliche APT-Repository veröffentlicht Paketindizes für `all`, `amd64` und `arm64`, damit APT das architecture-unabhängige Paket auf beiden Plattformen zuverlässig findet.

## 0.5.11

- Führt die geführte Proxmox-Einrichtung in der Admin-Oberfläche ein, inklusive Schlüsselerzeugung, Host-Key-Prüfung und vorbereitetem Root-Bootstrap-Befehl.

## 0.5.10

- Ergänzt einen kopierbaren SSH-Key-Installationsbefehl in der Admin-Oberfläche.

## 0.5.8

- Aktiviert einen eigenen Admin-Ingress für die Ersteinrichtung aus dem privaten LAN, während der privilegierte Admin-Dienst selbst auf Loopback gebunden bleibt.
- Ergänzt den sichtbaren Sicherheitshinweis für den noch nicht extern abgesicherten Admin-Zugang.

## 0.5.6

- Dokumentiert erstmals den vollständigen Self-Service-Ersteinrichtungsablauf nach der Paketinstallation.
- Ergänzt `docs/first-run.md` und erweitert Installations- und APT-Dokumentation.

## 0.5.5

- Vereinheitlicht Node.js 24 zwischen Laufzeit, Debian-Paket, APT-Installer und Release-Builder.

## 0.5.4

- Der Update-Builder verwendet das tatsächlich aktive npm-Executable und ist damit unabhängig von fest verdrahteten npm-Pfaden.

## 0.5.3

- Stellt die Release-CI auf Node.js 24 und aktuelle GitHub-Actions-Versionen um.

## 0.5.2

- Korrigiert den Node/npm-Pfad in den Release-Tests der CI.

## 0.5.1

- Behebt einen Deadlock beim Aktivieren einer Release-Version zwischen Admin-Control-Plane und Release-Manager.
- Passt die systemd-Abhängigkeiten so an, dass Release-Aktivierung und Rollback nicht durch Stop-Propagation blockiert werden.
