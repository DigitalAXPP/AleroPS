function Get-AleroVendors {
    [CmdletBinding(DefaultParameterSetName='ByString')]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='ByString',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='ByVendorId',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='ByPhoneNumber',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            ParameterSetName='ByString',
            HelpMessage='The ID of the Alero user who invited this vendor'
        )]
        [string]$InvitedBy,
        
        [Parameter(
            ParameterSetName='ByString',
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit = 0,
        
        [Parameter(
            ParameterSetName='ByString',
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset = 100,
        
        [Parameter(
            ParameterSetName='ByString',
            HelpMessage='The field in which to perform the search'
        )]
        [ValidateSet('ALL', 'GROUPS', 'COMPANY', 'FULLNAME')]
        [string]$SearchIn = 'FULLNAME',
        
        [Parameter(
            ParameterSetName='ByString',
            HelpMessage='The field in which to perform the search'
        )]
        [string]$SearchString,
        
        [Parameter(
            Mandatory,
            ParameterSetName='ByVendorId',
            HelpMessage='The unique ID of the vendor'
        )]
        [string]$VendorId,
        
        [Parameter(
            Mandatory,
            ParameterSetName='ByPhoneNumber',
            HelpMessage='The phone number that the user set when they registered for Alero, in international format'
        )]
        [string]$PhoneNumber
    )
    
    begin {
        
    }
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            "ByString" {
                $url = [string]::Concat("https://api.alero.io/v2-edge/vendors?", 
                    "invitedBy=$InvitedBy",
                    "&limit=$Limit",
                    "&offset=$Offset",
                    "&searchIn=$SearchIn",
                    "&searchString=$SearchString"
                    )
            }
            "ByVendorId" {
                $url = "https://api.alero.io/v2-edge/vendors/$VendorId"
            }
            "ByPhoneNumber" {
                $url = "https://api.alero.io/v2-edge/vendors/phone/$PhoneNumber"
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