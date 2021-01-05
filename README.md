# AleroPS
This repository contains functions to leverage the CyberArk Alero REST API. First and foremost it is noteworthy to mention the 'New-AleroToken' function which provides and easy-to-use option of retrieving/creating a temporary API token to authenticate to Alero.

## New-AleroToken
This function uses three classes which are named and represent the three parts of creating a JWT: Header, Claim set and Signature. The signature class requires the OpenSSL library in order to sign end encrypt the private key of the dedicated Alero service account. It is therefore necessary that the PowerShell console has OpenSSL installed. Here I connect a useful link to [install OpenSSL for PowerShell](https://adamtheautomator.com/install-openssl-powershell/). Additionally, it is possible to return the token as a secure string.

## Functions
The functions use the `-Authorization Bearer` and `-Token` parameters of the `Invoke-RestMethod` which are avaible since PowerShell version 6.0.0. Hence, the module as such can only be used from PowerShell version 6.0.0 and later. I thought about using the standard `-Headers` parameter which would make it compatible with earlier versions, however, primarily I want to promote the adoption of newer PowerShell versions, secondly, using the newer parameter options forces the user to use the token as a secure string. Therefore I keep this setup for now even though the token can be also returned as Base 64 string in clear string.

## How to use the module?

Creating the token is fairly easy. As prerequisites to run the function is OpenSSL installed (see link above), the JSON file containing the private key of the service account, the data center where your tenant is located and the ID of your tenant. You can find the ID of your tenant in the Alero URL. It is the first randomly generated string.

### Install and import
```PowerShell
Install-Module -Name AleroPS
Import-Module -Name AleroPS
```

### Create JSON Web Token
```PowerShell
$auth = New-AleroToken -Path .\11eb29d[...]c2051.json -Datacenter alero.io -TenantID 11eb0700[...]25fb604 -AsSecureString
```

### Run any further command
This command will return all existing Alero groups.
```PowerShell
Get-AleroGroups -Authn $auth -Search "*"
```
