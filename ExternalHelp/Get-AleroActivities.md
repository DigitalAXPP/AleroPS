---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Get-AleroActivities

## SYNOPSIS
This function returns a list of entries matching the selected actitivities.

## SYNTAX

```
Get-AleroActivities [-Authn] <SecureString> [-ActivityType] <String[]> [[-FromTime] <DateTimeOffset>]
 [[-ToTime] <DateTimeOffset>] [[-Limit] <Int32>] [[-Offset] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This command accepts an array of strings for the ActivityType parameter, which also has auto-complete functionality.
Additionally, you need to enter the timespan in a datetime format for the start and end date.

## EXAMPLES

### Example 1
```
PS C:\> Get-AleroActivities -Authn $auth -ActivityType GroupsCreated -FromTime ((Get-Date).AddDays(-3)) -ToTime (Get-Date)
```

This command returns all entries of group creation within the last three days.

## PARAMETERS

### -ActivityType
List of Activity Types to retrieve

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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
Start of the period

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

### -Limit
The maximum number of entries to return

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

### -Offset
The number of entries to skip

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ToTime
End of the period

```yaml
Type: DateTimeOffset
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
