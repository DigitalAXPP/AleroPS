function Edit-AleroVendor {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            HelpMessage="The vendor’s unique Id"
        )]
        [string]$VendorId,
        
        [Parameter(
            HelpMessage="The updated status of the vendor’s account."
        )]
        [ValidateSet('Deactivated', 'Activated')]
        [string]$Status
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/vendors/$VendorId/status"
        $body = $Status | ConvertTo-Json
        $result = Invoke-RestMethod -Method Put -Uri $url -ContentType 'application/json' -Authentication Bearer -Token $Authn -Body $body
    }
    
    end {
        
    }
}