function Edit-AleroVendor {
    [CmdletBinding(
        DefaultParameterSetName='Vendor',
        SupportsShouldProcess,
        ConfirmImpact='Medium'
    )]
    [OutputType([string])]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Status',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Vendor',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            ParameterSetName = 'Status',
            HelpMessage="The vendor’s unique Id"
        )]
        [Parameter(
            ParameterSetName = 'Vendor',
            HelpMessage="The vendor’s unique Id"
        )]
        [string]$VendorId,
        
        [Parameter(
            ParameterSetName = 'Vendor',
            HelpMessage='All vendor properties must be provided.'
        )]
        [Hashtable]$VendorUpdateRequest,
        
        [Parameter(
            ParameterSetName = 'Status',
            HelpMessage="The updated status of the vendor’s account."
        )]
        [ValidateSet('Deactivated', 'Activated')]
        [string]$Status
    )
    
    begin {
        
    }
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Status' { 
                $url = "https://api.alero.io/v2-edge/vendors/$VendorId/status"
                $body = $Status | ConvertTo-Json
            }
            'Vendor' {
                $url = "https://api.alero.io/v2-edge/vendors/$VendorId"
                $body = $VendorUpdateRequest | ConvertTo-Json -Depth 3
            }
            Default {}
        }
        $restBody = @{
            'Method' = 'Put'
            'Uri' = $url
            'ContentType' = 'application/json'
            'Authentication' = 'Bearer'
            'Token' = $Authn
            'Body' = $body
        }
        if ($PSCmdlet.ShouldProcess("VendorId: $VendorId", "Updating the vendor")) {
            $result = Invoke-RestMethod @restBody            
        }
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result
    }
}