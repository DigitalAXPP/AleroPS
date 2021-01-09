Describe "Get-AleroActivities" {
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
                Parameter = "ActivityType"
            }
        )
        It "<Parameter> is mandatory" -TestCases $mandatoryParameter {
            param($Parameter, $ParameterSet)
            $functionMeta = Get-Command -Name Get-AleroActivities
            $functionMeta.Parameters[$Parameter].Attributes.Mandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Retrieve all Alero actitivies for group creation within the past 24 hours" {
            $user = Get-AleroActivities -Authn $auth -ActivityType 'GroupsCreated'
            $user | Should -Not -BeNullOrEmpty
            $user | Should -BeOfType [PSCustomObject]
            $user.activities.activityType[0] | Should -BeExactly "GroupsCreated"
        }
        It "Retrieve all Alero actitivies for group administration within the past 24 hours" {
            $user = Get-AleroActivities -Authn $auth -ActivityType 'GroupsCreated', 'GroupsDeleted', 'GroupsUpdated'
            $user | Should -Not -BeNullOrEmpty
            $user | Should -BeOfType [PSCustomObject]
            $user.activities.activityType -contains 'GroupsCreated' | Should -BeTrue
            $user.activities.activityType -contains 'GroupsUpdated' | Should -BeTrue
            $user.activities.activityType -contains 'GroupsDeleted' | Should -BeTrue
        }
    }
}