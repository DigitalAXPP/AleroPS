# cybrAlero
This repository contains functions to leverage the CyberArk Alero REST API. First and foremost it is noteworthy to mention the 'New-AleroToken' function which provides and easy-to-use option of retrieving/creating a temporary API token to authenticate to Alero.

## New-AleroToken
This function uses three classes which are named and represent the three parts of creating a JWT: Header, Claim set and Signature. The signature class requires the OpenSSL library in order to sign end encrypt the private key of the dedicated Alero service account. It is therefore necessary that the PowerShell console has OpenSSL installed.