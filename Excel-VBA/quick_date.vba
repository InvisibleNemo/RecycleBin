Private Sub Worksheet_Change(ByVal Target As Excel.Range)
Dim TimeStr As String

On Error GoTo EndMacro
If Application.Intersect(Target, Range("I:J")) Is Nothing Then
    Exit Sub
End If
If Target.Cells.Count > 1 Then
    Exit Sub
End If
If Target.Value = "" Then
    Exit Sub
End If

Application.EnableEvents = False
With Target
If .HasFormula = False Then
    Select Case Len(.Value)
        Case 1 ' e.g., 1 = 00:01 AM
            TimeStr = "00:0" & .Value
        Case 2 ' e.g., 12 = 00:12 AM
            TimeStr = "00:" & .Value
        Case 3 ' e.g., 735 = 7:35 AM
            TimeStr = Left(.Value, 1) & ":" & _
            Right(.Value, 2)
        Case 4 ' e.g., 1234 = 12:34
            TimeStr = Left(.Value, 2) & ":" & _
            Right(.Value, 2)
        Case 5 ' e.g., 12345 = 1:23:45 NOT 12:03:45
            TimeStr = Left(.Value, 1) & ":" & _
            Mid(.Value, 2, 2) & ":" & Right(.Value, 2)
        Case 6 ' e.g., 123456 = 12:34:56
            TimeStr = Left(.Value, 2) & ":" & _
            Mid(.Value, 3, 2) & ":" & Right(.Value, 2)
        Case Else
            Err.Raise 0
    End Select
    .Value = TimeValue(TimeStr)
End If
End With
Application.EnableEvents = True
Exit Sub
EndMacro:
MsgBox "You did not enter a valid time"
Application.EnableEvents = True
End Sub

Private Sub Worksheet_SelectionChange(ByVal Target As Range)

End Sub
