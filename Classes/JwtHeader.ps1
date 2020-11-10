class JwtHeader {
    $format = @{
        alg = "RS256"
        typ = "JWT"
    }
    [string]Create()
    {
        $json = $this.format | ConvertTo-Json
        $base64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($json)) -replace '\+','-' -replace '/','_' -replace '='
        return  $base64
    }
}