function Edit-AleroUser {
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,
        
        [Parameter(
            Mandatory,
            HelpMessage='The unique ID of the user'
        )]
        [string]$UserId,
        
        [Parameter(
            Mandatory,
            HelpMessage="The updated status of the user’s account."
        )]
        [ValidateSet('Deactivated', 'Activated')]
        [string]$Status
    )
    
    begin {
        
    }
    
    process {
        $restCall = @{
            'Method' = 'Put'
            'ContentType' = 'application/json'
            'Uri' = "https://api.alero.io/v2-edge/users/$UserId/status"
            'Body' = ( $Status | ConvertTo-Json )
            'Authentication' = 'Bearer'
            'Token' = $Authn
        }
        $result = Invoke-RestMethod @restCall
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result
    }
}