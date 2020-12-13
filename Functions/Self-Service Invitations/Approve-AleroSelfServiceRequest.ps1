function Approve-AleroSelfServiceRequest {
    [CmdletBinding(
        SupportsShouldProcess,
        ConfirmImpact='Low'
    )]
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
        if ($PSCmdlet.ShouldProcess("RequestId: $RequestId", "Approve the pending request")) {
            $result = Invoke-RestMethod @restCall            
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}