# cybrAlero
This repository contains functions to leverage the CyberArk Alero REST API. First and foremost it is noteworthy to mention the 'New-AleroToken' function which provides and easy-to-use option of retrieving/creating a temporary API token to authenticate to Alero.

## New-AleroToken
This function uses three classes which are named and represent the three parts of creating a JWT: Header, Claim set and Signature. The signature class requires the OpenSSL library in order to sign end encrypt the private key of the dedicated Alero service account. It is therefore necessary that the PowerShell console has OpenSSL installed. Here I connect a useful link to [install OpenSSL for PowerShell](https://adamtheautomator.com/install-openssl-powershell/). Additionally, it is possible to return the token as a secure string.

## Functions
The functions use the `-Authorization Bearer` and `-Token` parameters of the `Invoke-RestMethod` which are avaible since PowerShell version 6.0.0. Hence, the module as such can only be used from PowerShell version 6.0.0 and later. I thought about using the standard `-Headers` parameter which would make it compatible with earlier versions, however, I also want to promote the adoption of newer PowerShell versions and therefore stuck with this setup for now.
