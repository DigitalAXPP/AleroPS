---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Edit-AleroVendor

## SYNOPSIS
This commands modifies a vendor in the Alero portal.

## SYNTAX

### Vendor (Default)
```
Edit-AleroVendor -Authn <SecureString> [-VendorId <String>] [-VendorUpdateRequest <Hashtable>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### Status
```
Edit-AleroVendor -Authn <SecureString> [-VendorId <String>] [-Status <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This command can change the status of a vendor in the Alero portal or the properties.
When modifying the properties, all properties must be provided.

## EXAMPLES

### Example 1
```
PS C:\> Edit-AleroVendor -Authn $auth -VendorId j2k4h23h423kjh423jh42k3j4 -Status Deactivated
```

The command deactivates the specified vendor.

### Example 2
```
PS C:\> Edit-AleroVendor -Authn $auth -VendorId j2k4h23h423kjh423jh42k3j4 -VendorUpdateRequest $updateBody
```

The command updates all properties specified in the hashtable object 'updateBody' for the vendor.

## PARAMETERS

### -Authn
Token to authenticate to Alero.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Status
The updated status of the vendor's account.

```yaml
Type: String
Parameter Sets: Status
Aliases:
Accepted values: Deactivated, Activated

Required: False
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VendorUpdateRequest
All vendor properties must be provided.

```yaml
Type: Hashtable
Parameter Sets: Vendor
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
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
