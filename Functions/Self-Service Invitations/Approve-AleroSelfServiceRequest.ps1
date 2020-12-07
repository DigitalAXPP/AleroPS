function Approve-AleroSelfServiceRequest {
    [CmdletBinding()]
    param (
        
        [Parameter(
            Mandatory,
            HelpMessage='Unique identifier of the request.'
        )]
        [string]$RequestId,
        
        [Parameter(
            Mandatory,
            HelpMessage='Self Service Invitation body. Fill out all properties'
        )]
        [HashTable]$RequestBody
    )
    
    begin {
        
    }
    
    process {
        $restCall = @{
            'Method' = 'Post'
            'Uri' = "https://api.alero.io/v2-edge/selfServiceRequests/$RequestId"
            'Body' = ($RequestBody | ConvertTo-Json -Depth 3)
            'ContentType' = 'application/json'
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