function Remove-AleroUser {
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
            HelpMessage='The unique ID of the user'
        )]
        [string]$UserId
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/users/$UserId"
        if ($PSCmdlet.ShouldProcess("UserId: $UserId", "Remove Alero user")) {
            $result = Invoke-RestMethod -Method Delete -Uri $url -Authentication Bearer -Token $Authn            
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}