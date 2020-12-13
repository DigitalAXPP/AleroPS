---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Deny-AleroSelfServiceRequest

## SYNOPSIS
This command rejects a pending request.

## SYNTAX

```
Deny-AleroSelfServiceRequest [-Authn] <SecureString> [[-RequestId] <String>] [<CommonParameters>]
```

## DESCRIPTION
This command rejects a pending request.

## EXAMPLES

### Example 1
```
PS C:\> Deny-AleroSelfServiceRequest -Authn $auth -RequestId asdf807s7afn13j4kk23j4
```

This command rejects the pending request.

## PARAMETERS

### -Authn
Token to authenticate to Alero.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -RequestId
The unique ID of the request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Security.SecureString
## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
