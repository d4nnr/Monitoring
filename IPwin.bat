@echo off
echo Choose:
echo [A] Set Ip_Statica
echo [B] Set Ip_Automatica
echo.
:choice
SET /P C=[A,B]?
for %%? in (A) do if /I "%C%"=="%%?" goto A
for %%? in (B) do if /I "%C%"=="%%?" goto B
goto choice
:A
@echo off
ipconfig /flushdns > nul
ipconfig /release > nul
netsh interface ipv4 set address name="Wi-Fi" source=static address=10.20.13.23 mask=255.255.254.0 gateway=10.20.13.1
add dnsservers "Wi-Fi" 10.20.30.3
add dnsservers "Wi-Fi" 10.20.30.2 index=2
pause
goto end
:end
:B
@echo off
ipconfig /flushdns > nul
ipconfig /release > nul
netsh interface ipv4 set address name="Wi-Fi" source=dhcp
netsh interface ipv4 add dnsserver name="Wi-Fi" source=dhcp index=1
netsh interface ipv4 add dnsserver name="Wi-Fi" source=dhcp index=2
ipconfig /renew > nul
pause
goto end
:end
