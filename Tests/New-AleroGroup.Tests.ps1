Describe "New-AleroGroup" {
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
            @{ Parameter = "Authn" }
            @{ Parameter = "Name" }
        )
        It "<Parameter> is mandatory" -TestCases $mandatoryParameter {
            param($Parameter)
            $functionMeta = Get-Command -Name New-AleroGroup
            $functionMeta.Parameters[$Parameter].Attributes.Mandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Create a new Alero group" {
            $groupName = "GRP-$(Get-Random -Maximum 10000)"
            $output = New-AleroGroup -Authn $auth -Name $groupName -Description "Test description"
            $output | Should -Not -BeNullOrEmpty
            $output | Should -BeOfType [PSCustomObject]
            $output.Description | Should -BeExactly "Test description"
            $output.Name | Should -Be $groupName
            Remove-AleroGroup -Authn $auth -GroupId $output.Id
        }
    }
}