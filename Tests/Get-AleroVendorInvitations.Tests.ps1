Describe "Get-AleroVendorInvitations" {
    BeforeAll {
        #region Importing the module
        $dir = Split-Path (Split-Path $PSScriptRoot -Parent) -Leaf
        Import-Module -Name $dir
        #endregion
        #region Importing configuration file
        $moduleDir = Split-Path -Path $PSScriptRoot -Parent
        $configFile =  Get-Content -Path "$(Split-Path -Path $moduleDir -Parent)\config.json" | ConvertFrom-Json
        $configPath = "$(Split-Path -Path $moduleDir -Parent)\$($configFile.PrivateKey)"
        #endregion
    }
    Context "Verifying parameters" {
        $mandatoryParameter = @(
            @{ 
                Parameter = "Authn"
                ParameterSet = "BySearch"
            }
            @{ 
                Parameter = "Authn"
                ParameterSet = "ByInvitationId"
            }
            @{ 
                Parameter = "InvitationId"
                ParameterSet = "ByInvitationId"
            }
        )
        It "<Parameter> is mandatory in parameterset <ParameterSet>" -TestCases $mandatoryParameter {
            param($Parameter, $ParameterSet)
            $functionMeta = Get-Command -Name Get-AleroVendorInvitations
            $functionMeta.Parameters[$Parameter].ParameterSets[$ParameterSet].IsMandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Retrieve all Alero vendor invitations" {
            $invitations = Get-AleroVendorInvitations -Authn $auth
            $invitations | Should -Not -BeNullOrEmpty
            $invitations | Should -BeOfType [PSCustomObject] 
        }
        It "Retrieve invitations based on string search" {            
            $invitations = Get-AleroVendorInvitations -Authn $auth -SearchString "Jason"
            $invitations | Should -Not -BeNullOrEmpty
            $invitations | Should -BeOfType [PSCustomObject] 
        }
        It "Retrieve invitations based on string search in company name" {            
            $invitations = Get-AleroVendorInvitations -Authn $auth -SearchString "Test Inc." -SearchIn COMPANY
            $invitations | Should -Not -BeNullOrEmpty
            $invitations | Should -BeOfType [PSCustomObject] 
        }
        It "Return two invitations" {            
            $invitations = Get-AleroVendorInvitations -Authn $auth -SearchString "Jason" -Limit 2 -Offset 1
            $invitations | Should -Not -BeNullOrEmpty
            $invitations | Should -BeOfType [PSCustomObject]
            $invitations.invitations | Should -HaveCount 2
        }
        It "Retrieve an invitation by ID" {            
            $invitations = Get-AleroVendorInvitations -Authn $auth -InvitationId $configFile.InvitationID
            $invitations | Should -Not -BeNullOrEmpty
            $invitations | Should -BeOfType [PSCustomObject]
            $invitations.id | Should -BeExactly $configFile.InvitationID
        }
    }
}