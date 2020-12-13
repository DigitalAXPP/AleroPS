---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Get-AleroSelfServiceRequest

## SYNOPSIS
This command queries all pending requests.

## SYNTAX

```
Get-AleroSelfServiceRequest [-Authn] <SecureString> [[-FromTime] <DateTimeOffset>] [[-ToTime] <DateTimeOffset>]
 [[-Limit] <Int32>] [[-Offset] <Int32>] [[-SearchIn] <String>] [[-SearchString] <String>] [<CommonParameters>]
```

## DESCRIPTION
The query can be tuned by string and time period.

## EXAMPLES

### Example 1
```
PS C:\> Get-AleroSelfServiceRequest -Authn $auth -FromTime (Get-Date -Date (Get-Date).AddDays(-15)) -ToTime (Get-Date -Date (Get-Date)) -SearchIn FULLNAME -SearchString "Mustermann"
```

This command queries all pending request by their fullname of the last 15 days.

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

### -FromTime
Period to start including requests in the query

```yaml
Type: DateTimeOffset
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
The maximum number of entries to return

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
The number of entries to skip

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchIn
The field in which to perform the search

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: ALL, VENDOR_EMAIL_DOMAIN, VENDOR_EMAIL, VENDOR_NAME

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchString
The query string

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ToTime
Period when the query ends.

```yaml
Type: DateTimeOffset
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
