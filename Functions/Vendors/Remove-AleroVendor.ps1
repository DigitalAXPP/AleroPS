function Remove-AleroVendor {
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
            HelpMessage='The unique ID of the vendor'
        )]
        [string]$VendorId
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/vendors/$VendorId"
        if ($PSCmdlet.ShouldProcess("VendorId: $VendorId", "Delete the Vendor")) {
            $result = Invoke-RestMethod -Method Delete -Uri $url -Authentication Bearer -Token $Authn            
        }
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result        
    }
}