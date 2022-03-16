<h1 align="center">
  <a href="https://blackseals.net">
    <img src="https://blackseals.net/features/blackseals.png" width=66% alt="BlackSeals">
  </a>
</h1>

> Promoted development by BlackSeals.net Technology.
> Written by Andyt for BlackSeals.net.
> Copyright 2021-2022 by BlackSeals Network.

## Description

**set_wap_le-certificate.ps1** is a Windows PowerShell script that will change certificate on Web Application Proxy from CertifyTheWeb setup.


## Requirement

* **[Web Application Proxy](https://docs.microsoft.com/en-us/windows-server/remote/remote-access/web-application-proxy/web-application-proxy-in-windows-server)** is a Windows Server role and work as a reverse proxy server. It is working with Windows Server 2016 and newer. Only Web Application Proxy Application with "LE" at the end of the name will be processed - all other will be ignored.
* **[CertifyTheWeb](https://certifytheweb.com)** manage free automated https certificates for IIS, Windows and other services. The installation should be on the same Windows Server with enabled Web Application Proxy role. You need to add within CertifyTheWeb a wildcard certificate with Let's Encrypt and DNS Challenge. You need no selected IIS website. Deployment Mode should be "Certificate Store Only". Deployment Tasks should be the Powershell script file. I use local Authentication and local Credentials. It is urgent to enable **"Pass Result as First Arg"**.

 
## Quick Start

Download the script and copy **set_wap_le-certificate.ps1** to the server which had installed CertifyTheWeb. Look to Requirement for more information.


## Syntax

`.\set_wap-certificate.ps1`
* no parameters necessary


## Examples

`.\set_wap-certificate.ps1`
* The script get the result from CertifyTheWeb without extra parameters.
* There is no logfile after finishing the process.

`.\set_wap-certificate.ps1 Save`
* The script get the result from CertifyTheWeb without extra parameters.
* There is a logfile after finishing the process. You find it at your temporary user folder: $env:temp (Powershell) or %temp% (Explorer, Command Shell).

