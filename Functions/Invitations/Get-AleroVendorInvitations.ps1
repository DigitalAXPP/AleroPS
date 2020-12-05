function Get-AleroVendorInvitations {
    [CmdletBinding(DefaultParameterSetName='BySearch')]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'BySearch',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'ByInvitationId',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            ParameterSetName = 'BySearch',
            HelpMessage='The ID of the Alero user who created the invitation'
        )]
        [string]$CreatedBy,
        
        [Parameter(
            ParameterSetName = 'BySearch',
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit = 100,
        
        [Parameter(
            ParameterSetName = 'BySearch',
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset = 0,

        [Parameter(
            ParameterSetName = 'BySearch',
            HelpMessage='The field in which to perform the search'
        )]
        [ValidateSet('ALL', 'FULLNAME', 'COMPANY', 'PHONE', 'EMAIL', 'GROUPS')]
        [string]$SearchIn = 'FULLNAME',
        
        [Parameter(
            ParameterSetName = 'BySearch',
            HelpMessage='The string to be searched'
        )]
        [string]$SearchString,

        [Parameter(
            Mandatory,
            ParameterSetName='ByInvitationId',
            HelpMessage='The invitationId'
        )]
        [string]$InvitationId
    )
    
    begin {
        
    }
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'ByInvitationId' { 
                $url = "https://api.alero.io/v2-edge/invitations/vendor-invitations/$InvitationId"
            }
            'BySearch' { 
                $url = [string]::Concat("https://api.alero.io/v2-edge/invitations/vendor-invitations/?",
                "createdBy=$CreatedBy",
                "&limit=$Limit",
                "&offset=$Offset",
                "&searchIn=$SearchIn",
                "&searchString=$SearchString"
                )
            }
            Default {}
        }
        
        $result = Invoke-RestMethod -Method Get -Uri $url -Authentication Bearer -Token $Authn
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result
    }
}