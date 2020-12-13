---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Get-AleroVendors

## SYNOPSIS
This function returns all vendors who match the search criteria.

## SYNTAX

### ByString (Default)
```
Get-AleroVendors -Authn <SecureString> [-InvitedBy <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-SearchIn <String>] [-SearchString <String>] [<CommonParameters>]
```

### ByPhoneNumber
```
Get-AleroVendors -Authn <SecureString> -PhoneNumber <String> [<CommonParameters>]
```

### ByVendorId
```
Get-AleroVendors -Authn <SecureString> -VendorId <String> [<CommonParameters>]
```

## DESCRIPTION
You can search vendors based on a string, their phone number or their vendor ID.

## EXAMPLES

### Example 1
```
PS C:\> Get-AleroVendors -Authn $auth -SearchIn ALL -SearchString "Anna"
```

This command returns all vendors who have 'Anna' mentioned anywhere in their profile.

### Example 2
```
PS C:\> Get-AleroVendors -Authn $auth -PhoneNumber +49123456789
```

This command returns the vendor who has the entered international phone number registered in their profile.

### Example 3
```
PS C:\> Get-AleroVendors -Authn $auth -VendorId 12j3h2k4h21jkhg4jk123h4g
```

This command returns the vendor with the entered ID.

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

### -InvitedBy
The ID of the Alero user who invited this vendor

```yaml
Type: String
Parameter Sets: ByString
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
The maximum number of entries to return

```yaml
Type: Int32
Parameter Sets: ByString
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
The number of entries to skip

```yaml
Type: Int32
Parameter Sets: ByString
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PhoneNumber
The phone number that the user set when they registered for Alero, in international format

```yaml
Type: String
Parameter Sets: ByPhoneNumber
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchIn
The field in which to perform the search

```yaml
Type: String
Parameter Sets: ByString
Aliases:
Accepted values: ALL, GROUPS, COMPANY, FULLNAME

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchString
The field in which to perform the search

```yaml
Type: String
Parameter Sets: ByString
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VendorId
The unique ID of the vendor

```yaml
Type: String
Parameter Sets: ByVendorId
Aliases:

Required: True
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
