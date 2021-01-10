Describe "New-AleroInvitation" {
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
            }
            @{ 
                Parameter = "InvitationRequest"
            }
        )
        It "<Parameter> is mandatory" -TestCases $mandatoryParameter {
            param($Parameter)
            $functionMeta = Get-Command -Name New-AleroInvitation
            $functionMeta.Parameters[$Parameter].Attributes.Mandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Invite new Alero vendor" {    
            $request = @{
                "accessEndDate" = ([System.DateTimeOffset](Get-Date).AddDays(10)).ToUnixTimeMilliseconds()
                "accessStartDate" = ([System.DateTimeOffset](Get-Date)).ToUnixTimeMilliseconds()
                "applications" = @(
                    @{
                    "applicationId" = $configFile.ApplicationID
                    "siteId" = $configFile.SiteID
                    }
                )
                "canInvite" = $true
                "companyName" = "Test Inc."
                "emailAddress" = "test@attempt.here"
                "firstName" = "Jason"
                "initialStatus" = "Activated"
                "invitedVendorsInitialStatus" = "Activated"
                "lastName" = "Smith"
                "maxNumOfInvitedVendors" = 10
                "phoneAndEmailAuth" = $false
                "phoneNumber" = "+972058655541"
                "provisioningGroups" = @(
                    $configFile.GroupID
                )
                "provisioningType" = "ProvisionedByAlero"
                "provisioningUsername" = "Jason.Smith@Test-Inc.alero"
            }        
            $vendor = New-AleroInvitation -Authn $auth -InvitationRequest $request
            $vendor | Should -Not -BeNullOrEmpty
            $vendor | Should -BeOfType [string]
            $vendor.Length | Should -BeExactly 32
        }
        It "Invite new Alero user" {
            $request = @{
                "initialStatus" = "Deactivated"
                "invitationExpirationTime" = ([System.DateTimeOffset](Get-Date).AddDays(10)).ToUnixTimeMilliseconds()
                "usersToInvite" = @(
                    @{
                    "emailAddress" = "test@email.mail"
                    "name" = "Jason Watts"
                    }
                )
            }
            $user = New-AleroInvitation -Authn $auth -InvitationRequest $request -UserInvitation
            $user | Should -Not -BeNullOrEmpty
            $user | Should -BeOfType [string]
            $user.Length | Should -BeExactly 32
        }
    }
}