---
external help file: cybrAlero-help.xml
Module Name: cybrAlero
online version:
schema: 2.0.0
---

# Edit-AleroVendor

## SYNOPSIS
This commands modifies a vendor in the Alero portal.

## SYNTAX

```
Edit-AleroVendor [-Authn] <SecureString> [[-VendorId] <String>] [[-Status] <String>] [<CommonParameters>]
```

## DESCRIPTION
This command can change the status of a vendor in the Alero portal.

## EXAMPLES

### Example 1
```powershell
PS C:\> Edit-AleroVendor -Authn $auth -VendorId j2k4h23h423kjh423jh42k3j4 -Status Deactivated
```

The command deactivates the specified vendor.

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

### -Status
The updated status of the vendor's account.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Deactivated, Activated

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VendorId
The vendor's unique Id

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

### System.Object
## NOTES

## RELATED LINKS
