Sub WorksheetLoop()

         Dim OldYear As Variant
         Dim NewYear As Variant
         Dim WS_Count As Integer
         Dim I As Integer
         Dim wsA As Worksheet
         Dim wbA As Workbook
         'Dim strTime As String
         Dim strName As String
         Dim strPath As String
         Dim strFile As String
         Dim strPathFile As String
         Dim myFile As Variant
'On Error GoTo errHandler
        
        
        OldYear = InputBox("Enter the old year")
        NewYear = InputBox("Enter the new year")
        
        For Each wsA In ActiveWorkbook.Worksheets
          wsA.Cells.Replace what:=OldYear, Replacement:=NewYear, _
            LookAt:=xlPart, SearchOrder:=xlByRows, MatchCase:=False, _
            SearchFormat:=False, ReplaceFormat:=False
        Next wsA
        
        Set wbA = ActiveWorkbook

         ' Set WS_Count equal to the number of worksheets in the active
         ' workbook.
         WS_Count = ActiveWorkbook.Worksheets.Count

         ' Begin the loop.
         For I = 1 To WS_Count

            ' Insert your code here.
            ' The following line shows how to reference a sheet within
            ' the loop by displaying the worksheet name in a dialog box.
            
            
            Worksheets(ActiveWorkbook.Worksheets(I).Name).Activate
            Set wsA = ActiveSheet
            'strTime = Format(Now(), "yyyymmdd\_hhmm")
            
            'get active workbook folder, if saved
            strPath = wbA.Path
            If strPath = "" Then
              strPath = Application.DefaultFilePath
            End If
            strPath = strPath & "\"
            
            'replace spaces and periods in sheet name
            strName = wsA.Name
            strName = Replace(strName, ".xlsm", "")
            'strName = Replace(strName, ".", "_")
            
            'create default name for savng file
            strFile = strName & ".pdf"
            strPathFile = strPath & strFile
            
            myFile = strPathFile
            
            'user can enter name and
            ' select folder for file
            'myFile = Application.GetSaveAsFilename _
                (InitialFileName:=strPathFile, _
                    FileFilter:="PDF Files (*.pdf), *.pdf", _
                    Title:="Select Folder and FileName to save")
            
            'export to PDF if a folder was selected
            If myFile <> "False" Then
                wsA.ExportAsFixedFormat _
                    Type:=xlTypePDF, _
                    Filename:=myFile, _
                    Quality:=xlQualityStandard, _
                    IncludeDocProperties:=True, _
                    IgnorePrintAreas:=False, _
                    OpenAfterPublish:=False
                'confirmation message with file info
                'MsgBox "PDF file has been created: " _
                  & vbCrLf _
                  & myFile
            End If
'exitHandler:
'                Exit Sub
'errHandler:
'                MsgBox "Could not create PDF file"
'                Resume exitHandler
            'MsgBox ActiveWorkbook.Worksheets(I).Name
         Next I
End Sub


