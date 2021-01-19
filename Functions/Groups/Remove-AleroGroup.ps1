function Remove-AleroGroup {
    [CmdletBinding(
        SupportsShouldProcess,
        ConfirmImpact='Medium'
    )]
    [OutputType([string])]
    param (
        [Parameter(
            Mandatory,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,
        
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            HelpMessage='The unique ID of the AleroLDAP group.'
        )]
        [string]$GroupId
    )
    
    begin {
    }
    
    process {
        $restBody = @{
            'Method' = 'Delete'
            'Uri' = "https://api.alero.io/v2-edge/groups/$GroupId"
            'Authentication' = 'Bearer'
            'Token' = $Authn
        }
        if ($PSCmdlet.ShouldProcess("GroupId: $GroupId", "Remove the Alero group")) {
            $result = Invoke-RestMethod @restBody
        }
    }
    
    end {
        Write-Output -InputObject $result
    }
}