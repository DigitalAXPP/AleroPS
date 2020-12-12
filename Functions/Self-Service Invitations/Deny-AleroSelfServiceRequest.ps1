function Deny-AleroSelfServiceRequest {
    [CmdletBinding(
        SupportsShouldProcess,
        ConfirmImpact='Medium'
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
            HelpMessage='The unique ID of the request.'
        )]
        [string]$RequestId
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/selfServiceRequests/$RequestId"
        if ($PSCmdlet.ShouldProcess("RequestId: $RequestId", "Reject the pending request")) {
            $result = Invoke-RestMethod -Method Delete -Uri $url -Authentication Bearer -Token $Authn            
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}