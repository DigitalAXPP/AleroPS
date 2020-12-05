function New-AleroVendorInvitation {
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
            HelpMessage='Enter all properties of the Vendor Invitation Request'
        )]
        [HashTable]$InvitationRequest
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/invitations/vendor-invitations"
        $body = $InvitationRequest | ConvertTo-Json -Depth 3
        $result = Invoke-RestMethod -Method Post -Uri $url -Body $body -Authentication Bearer -Token $Authn -ContentType 'application/json'
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result
    }
}