# Runbook: Kein Internet (Windows Client)

**Symptom**  
User meldet: „Kein Internet“, Webseiten laden nicht, Outlook empfängt nicht.

**Umfeld**  
Windows 10/11, Ethernet/WLAN, evtl. VPN/Proxy.

**Diagnose (Reihenfolge)**  
1. `ipconfig /all` – IP/DNS/Gateway prüfen  
2. `ping 8.8.8.8 -n 4` – Internet-Konnektivität  
3. `ping google.com -n 4` – DNS-Auflösung  
4. `nslookup google.com` – DNS-Server prüfen  
5. `tracert 8.8.8.8` – Routing  
6. Adapter aus/an (GUI oder PowerShell)  
7. `ipconfig /release` → `ipconfig /renew`  
8. `ipconfig /flushdns`  
9. `netsh winsock reset` & `netsh int ip reset` (ggf. Neustart)  
10. `netsh winhttp show proxy` (Proxy prüfen)

**Typische Fehlerbilder → Lösung**  
- `169.254.x.x` → DHCP-Problem (Router/Server prüfen, temporär statische IP testen)  
- Ping 8.8.8.8 OK, `google.com` FAIL → DNS ändern (z. B. 8.8.8.8)  
- Alle Pings FAIL → physikalisch/Provider prüfen (Kabel/Router/Switch)

**Nachkontrolle**  
`ipconfig /all` erneut, `ping google.com`, Browser-Test.

**Screenshots**  
- `labs/lab1-kein-internet/screenshots/ipconfig.png`  
- `labs/lab1-kein-internet/screenshots/ping.png`

**Notizen**  
Ticket im Board anlegen; wenn wiederkehrend, Runbook verfeinern.
