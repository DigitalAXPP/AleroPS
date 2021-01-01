Describe "New-AleroToken" {
    BeforeAll {
        #region Importing the module
        $dir = Split-Path (Split-Path $PSScriptRoot -Parent) -Leaf
        Import-Module -Name $dir
        #endregion
    }
    Context "Validating function input" {
        It "Verifying correct parameters." {
            
        }
    }
}