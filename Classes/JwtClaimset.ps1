class JwtClaimSet {
    [string]$ServiceAccountId
    [string]$TenantID
    [string]$AleroSite

    JwtClaimSet(
        [string]$ServiceAccountId,
        [string]$TenantID,
        [string]$AleroSite)
    {
        $this.ServiceAccountId = $ServiceAccountId
        $this.TenantID = $TenantID
        $this.AleroSite = $AleroSite
    }

    [string]Create()
    {
        $now = (Get-Date).ToUniversalTime()    
        $createDate = [Math]::Floor([decimal](Get-Date($now) -UFormat "%s"))    
        $expiryDate = [Math]::Floor([decimal](Get-Date($now.AddHours(72)) -UFormat "%s"))

        Write-Verbose -Message "The claim set will be created."
        $rawclaims = [Ordered]@{    
            aud = "https://auth.$($this.AleroSite)/auth/realms/serviceaccounts"        
            iss = "$($this.TenantID).$($this.ServiceAccountId).ExternalServiceAccount"        
            sub = "$($this.TenantID).$($this.ServiceAccountId).ExternalServiceAccount"        
            nbf = "0"        
            exp = $expiryDate        
            iat = $createDate        
            jti = [guid]::NewGuid()
        } | ConvertTo-Json

        $rawclaims = $rawclaims -replace ' ' -replace "`r|`n"
        return [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($rawclaims)) -replace '\+','-' -replace '/','_' -replace '='
    }
}