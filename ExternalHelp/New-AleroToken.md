---
external help file: cybrAlero-help.xml
Module Name: cybrAlero
online version:
schema: 2.0.0
---

# New-AleroToken

## SYNOPSIS
Creating an authentication token for a service account from CyberArk Alero.

## SYNTAX

```
New-AleroToken [-Path] <FileInfo> [-Datacenter] <String> [-TenantID] <String> [-AsSecureString]
 [<CommonParameters>]
```

## DESCRIPTION
This is an easy-to-use function to create a JWT (JSON Web Token) for authentication to CyberArk Alero. Required is the JSON file containing the private key for the service account, the data center of your tenant and the ID of your tenant. This function has a switch to convert the token to a secure string. The module has one dependency to OpenSSL. The token is valid for 5 minutes.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-AleroToken -Path .\j23h42k41jn3hj52h41253245.json -DataCenter alero.io -TenantID 1342nm253453n5m214
```

This functions returns a token.

## PARAMETERS

### -AsSecureString
Returns the token as a secure string.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Datacenter
Select the datacenter of your Alero instance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: alero.io, alero.eu

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Enter the path to your service account JSON file.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TenantID
Enter the ID your company in Alero.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
