function New-AleroToken {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            HelpMessage='Enter the path to your service account JSON file.'
        )]
        [System.IO.FileInfo]$Path,
        
        [Parameter(
            Mandatory,
            HelpMessage='Select the datacenter of your Alero instance.'
        )]
        [ValidateSet('alero.io', 'alero.eu', 'ca.alero.io')]
        [string]$Datacenter,
        
        [Parameter(
            Mandatory,
            HelpMessage='Enter the ID your company in Alero.'
        )]
        [string]$TenantID,
        
        [Parameter(
            HelpMessage='Returns the token as a secure string.'
        )]
        [switch]$AsSecureString
    )
    
    begin {
    }
    
    process {
        Write-Verbose -Message "Retrieving content from the Alero JSON file."
        $authenticationFile = Get-Content -Path $Path | ConvertFrom-Json
        Write-Verbose -Message "Creating the JWT Header."
        $jwtHeader = [JwtHeader]::new().Create()
        Write-Verbose -Message "Creating the JWT claim set."
        $jwtClaimSet = [JwtClaimSet]::new($authenticationFile.serviceAccountId, $TenantID, $Datacenter).Create()
        Write-Verbose -Message "Creating the JWT signature."
        $jwtSignature = [JwtSignature]::new($authenticationFile.privateKey, "$jwtHeader.$jwtClaimSet").Create()

        Write-Verbose -Message "Sending the API call."
        $url="https://auth.$Datacenter/auth/realms/serviceaccounts/protocol/openid-connect/token"
        $body = @{
            grant_type='client_credentials'
            client_assertion_type='urn:ietf:params:oauth:client-assertion-type:jwt-bearer'
            client_assertion=$jwtSignature
        }
        $response = Invoke-RestMethod -Method Post -Uri $url -Body $body -ContentType "application/x-www-form-urlencoded"
    }
    
    end {
        Write-Verbose -Message "Returning the access token."
        if ($AsSecureString) {
            Write-Verbose -Message "Encrypts the access token in a secure string class."
            Write-Output -InputObject (ConvertTo-SecureString -String $response.access_token -AsPlainText -Force)
        }
        else {
            Write-Output -InputObject $response.access_token   
        }
        Remove-Variable -Name response
    }
}