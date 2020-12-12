function Remove-AleroVendorInvitation {
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
            HelpMessage='The invitation to be removed'
        )]
        [string]$InvitationId
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/invitations/vendor-invitations/$InvitationId"
        if ($PSCmdlet.ShouldProcess("VendorId: $VendorId", "Removing vendor")) {
            $result = Invoke-RestMethod -Method Delete -Uri $url -Authentication Bearer -Token $Authn            
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}