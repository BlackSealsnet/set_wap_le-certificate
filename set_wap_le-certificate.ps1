#Syntax: .\set_wap-certificate.ps1
#Example no Logfile is saved: .\set_wap-certificate.ps1
#Example with saved Logfile: .\set_wap-certificate.ps1 Save
param(
$result
)

#Variablen
$script:ver = "3.1"
$script:name = "Set WAP LE-Certificate Script"
$script:verdate = "11.02.2021"
$script:tmplogfile = "$env:temp\set_wap-certificate.tmp"
$script:logfile = "$env:temp\set_wap-certificate.log"


$script:startdate = get-date -uformat "%d.%m.%Y"
$script:starttime = get-date -uformat "%R"

$script:thumbprint = $result.ManagedItem.CertificateThumbprintHash


#Informationsblock Anfang
Write-Output ""
Write-Output "=========================================================================="
Write-Output "$name Ver. $ver, $verdate"
Write-Output "Written by Andyt for face of buildings planning stimakovits GmbH"
Write-Output "Promoted development by BlackSeals.net Technology"
Write-Output "Copyright 2021 by Reisenhofer Andreas"
Write-Output "=========================================================================="
Write-Output "Gestartet am $startdate um $starttime Uhr..."
Write-Output ""

Write-Output "_____________________________________________________________________________" >"$tmplogfile"
Write-Output "Set $name Ver. $ver, $verdate" >>"$tmplogfile"
Write-Output "Gestartet am $startdate um $starttime Uhr..." >>"$tmplogfile"
Write-Output "" >>"$tmplogfile"

#Erhaltene Variabeln
Write-Output "Erhaltenes Zertifikat: $thumbprint"
Write-Output "Erhaltenes Zertifikat: $thumbprint" >>"$tmplogfile"

#Setzen des Zertifikates
Get-WebApplicationProxyApplication -Name "*LE" | Set-WebApplicationProxyApplication –ExternalCertificateThumbprint $thumbprint >>"$tmplogfile"
Set-WebApplicationProxySslCertificate -Thumbprint $thumbprint >>"$tmplogfile"


#Informationsblock Ende
Write-Output "Abarbeitung am $(get-date -uformat "%d.%m.%Y") um $(get-date -uformat "%R") Uhr beendet."
Write-Output ""

Write-Output "Abarbeitung am $(get-date -uformat "%d.%m.%Y") um $(get-date -uformat "%R") Uhr beendet." >>"$tmplogfile"
Write-Output "" >>"$tmplogfile"

#Kontrolle ob Logfile existiert und gespeichert wird
if (Test-Path $tmplogfile) {

	#Kontrolle ob Logfile gespeichert werden soll.
    if ($Args[2] -eq "Save") {
        Get-Content "$tmplogfile" >>"$logfile"
    }
    remove-item -path "$tmplogfile" -force
}
