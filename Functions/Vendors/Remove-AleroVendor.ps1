function Remove-AleroVendor {
    [CmdletBinding()]
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
        $result = Invoke-RestMethod -Method Delete -Uri $url -Authentication Bearer -Token $Authn
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result        
    }
}