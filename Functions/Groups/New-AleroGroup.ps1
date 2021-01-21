function New-AleroGroup {
    [CmdletBinding(
        SupportsShouldProcess,
        ConfirmImpact='Medium'
    )]
    param (
        [Parameter(
            Mandatory,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            Mandatory,
            ValueFromPipeline,
            HelpMessage='The name of the AleroLDAP group that will be added as a member to CyberArk Safes.'
        )]
        [string]$Name,
        
        [Parameter(
            HelpMessage='The description of the AleroLDAP group.'
        )]
        [string]$Description
    )
    
    begin {
        $result = [System.Collections.ArrayList]@()
    }
    
    process {
        $restCall = @{
            'Method' = 'POST'
            'Uri' = 'https://api.alero.io/v2-edge/groups'
            'Body' = ( @{
                'name' = $Name
                'description' = $Description
            } | ConvertTo-Json )
            'Authentication' = 'Bearer'
            'Token' = $Authn
            'ContentType' = 'application/json'
        }
        if ($PSCmdlet.ShouldProcess($Name, "Create the Alero group.")) {
            [void]$result.Add((Invoke-RestMethod @restCall))
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}