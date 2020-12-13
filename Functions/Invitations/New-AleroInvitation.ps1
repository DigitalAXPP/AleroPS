function New-AleroInvitation {
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
            Mandatory,
            HelpMessage='Enter all properties of the Invitation Request'
        )]
        [HashTable]$InvitationRequest,
        
        [Parameter(
            HelpMessage='Select this flag if you invite an Alero user'
        )]
        [switch]$UserInvitation
    )
    
    begin {
        
    }
    
    process {
        if ($UserInvitation) {
            $url = "https://api.alero.io/v2-edge/invitations/user-invitations"
        }
        else {
            $url = "https://api.alero.io/v2-edge/invitations/vendor-invitations"
        }
        $restCall = @{
            'Method' = 'Post'
            'Uri' = $url
            'Body' = ($InvitationRequest | ConvertTo-Json -Depth 3)
            'Authentication' = 'Bearer'
            'Token' = $Authn
            'ContentType' = 'application/json'
        }
        if ($PSCmdlet.ShouldProcess("Alero Invitation", "Creating a new invitation")) {
            $result = Invoke-RestMethod @restCall            
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}