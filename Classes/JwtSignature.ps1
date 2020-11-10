class JwtSignature {
    [string]$PrivateKey
    [string]$JwtData

    JwtSignature([string]$key, [string]$jwtData) {
        $this.PrivateKey = $key
        $this.JwtData = $jwtData
    }

    [string]Create(){
        Write-Verbose -Message "Creating temporary private key file."
        Set-Content -Path $env:TEMP\PrivateKey.pem -Value $this.PrivateKey

        Write-Verbose -Message "Creating the file containing the data to sign."
        Set-Content -Path $env:TEMP\data.txt -Value $this.JwtData -NoNewline

        Write-Verbose -Message "Sign the data and store it in a temporary file."
        openssl dgst -sha256 -sign "$env:TEMP\PrivateKey.pem" -out "$env:TEMP\sig.txt" "$env:TEMP\data.txt"

        Write-Verbose -Message "Creating the RSA signature."
        $rsa_signature = [System.IO.File]::ReadAllBytes("$env:TEMP\sig.txt")
        $rsa_signature = [Convert]::ToBase64String($rsa_signature)
        $rsa_signature = $rsa_signature -replace '\+','-' -replace '/','_' -replace '='

        Write-Verbose -Message "Removing the temporary files."
        Remove-Item -Path $env:TEMP\sig.txt -Force
        Remove-Item -Path $env:TEMP\PrivateKey.pem -Force
        Remove-Item -Path $env:TEMP\data.txt -Force
        
        return "$($this.JwtData).$($rsa_signature)"
    }
}