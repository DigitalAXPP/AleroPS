Describe "Remove-AleroVendorInvitation" {
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
                Parameter = "InvitationId"
            }
        )
        It "<Parameter> is mandatory" -TestCases $mandatoryParameter {
            param($Parameter)
            $functionMeta = Get-Command -Name Remove-AleroVendorInvitation
            $functionMeta.Parameters[$Parameter].Attributes.Mandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Remove Alero vendor invitation" {
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
            $invitation = Remove-AleroVendorInvitation -Authn $auth -InvitationId $vendor
            $invitation | Should -BeNullOrEmpty
            $invitation | Should -BeOfType [string] 
        }
    }
}