VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub stock_count()
'---------------------------------------------------
'H O M E W O R K  V B A  W E E K  2
'---------------------------------------------------

'Dim Current As Worksheet                                    ' Worksheets Activation
'For Each Current In Worksheets


'--------------------------------------------------------
'   The VBA of Wall Street
'--------------------------------------------------------


'--------------------------------------------------------
' Declaring Variables
'--------------------------------------------------------
  Dim StockTtl As Double        ' Variable for Stock Amount
  Dim StockNm As String         ' Temp Variable for Stock Name
  Dim SumTab_Row As Double      ' Track location each stock
  Dim StockCnt As Double        ' Temp Variable for Stock Amount
  Dim StockIni As Double        ' Variables to compare Stock values
  Dim StockEnd As Double        ' Variables to compare Stock values
  Dim LastRow As Long           ' Variable for last row value
  Dim GreatFinal As Double      ' Temporary variable to compare stock value
  Dim GreatTemp As Double       ' Temporary variable to compare stock value
  
  StockTtl = 0                  ' Initializing variables
  StockCnt = 0
  SumTab_Row = 2
  StockIni = 0
  StockEnd = 0
  StockPer = 0
    
    Range("I:Q").Value = ""                                                             ' Formating Worksheet's Header
    Range("I:Q").Interior.ColorIndex = 0
    Range("I1").Value = "Ticker"
    Range("J1").Value = "Yearly Change"
    Range("K1").Value = "Percent Change"
    Range("L1").Value = "Total Stock Volume"
    Range("P1").Value = "Ticker"
    Range("Q1").Value = "Value"
    Range("O2").Value = "Greatest % Increase"
    Range("O3").Value = "Greatest % Decrease"
    Range("O4").Value = "Greatest Total Volume"
    Range("I:O").Columns.AutoFit
   
    
  
    LastRow2 = ActiveSheet.Cells(Rows.Count, "A").End(xlUp).Row
  
For i = 2 To LastRow2                                          ' Loop to scan cells per column
     If Cells(i + 1, 1).Value = Cells(i, 1).Value Then      ' Values comparator to find Ticker value change
        StockNm = Cells(i, 1).Value
        StockIni = Cells(i - StockCnt, 3)                   ' Comparing Open values
        StockCnt = StockCnt + 1
        StockTtl = StockTtl + Cells(i, 7).Value             ' Comparing close value
       
     Else
        StockTtl = StockTtl + Cells(i, 7).Value             ' Loop to scan cells per column
        DatTemp = Cells(i, 2).Value
        StockNm = Cells(i, 1).Value
        StockCnt = StockCnt + 1
        StockEnd = Cells(i, 6).Value
        Range("I" & SumTab_Row).Value = StockNm             ' Writing results for Ticker
        Range("L" & SumTab_Row).Value = StockTtl            ' Writing results for Total Volume
        Range("J" & SumTab_Row).Value = StockIni - StockEnd ' Writing results for Yearly Change
        Select Case StockIni                                ' Stock values comparator
        Case Is <> 0
        StockPer = (StockIni - StockEnd) / StockIni         ' Calculatin Percent Change
        Case Is = 0
        StockPer = 0
        End Select
        Columns("K:K").NumberFormat = "00.0%"               ' Fomating column
        Range("K" & SumTab_Row).Value = StockPer            ' Writing results for Percentage Change
        
        
        StockCnt = 0
        StockTtl = 0
        SumTab_Row = SumTab_Row + 1
      
     End If                                                 ' Next Ticker
     
  Next i                                                    ' Next row
 


LastRow1 = ActiveSheet.Cells(Rows.Count, "L").End(xlUp).Row                             ' last Row Calculation for Greatest Calculation
 GreatFinal = 0                                                                         ' Calculating Greates Total Volume
 For j = 2 To 10 'LastRow1
 GreatTemp = Cells(j, 12)
 If GreatTemp > GreatFinal Then
 GreatFinal = GreatTemp
 Else
 End If
 Next j
 Range("P4").Value = GreatFinal
 
 LastRow1 = ActiveSheet.Cells(Rows.Count, "L").End(xlUp).Row
 GreatFinal = 0                                                                         ' Calculating Greates % Increase
 GreatFinal2 = 0
 GreatFinal3 = 0
For j = 2 To LastRow1
 GreatTemp = Cells(j, 12).Value
 If GreatTemp > GreatFinal Then
 GreatFinal = GreatTemp
 GreatTic = Cells(j, 9).Value                                                           ' Adquiring Ticker
 Else
 End If
 
 
 GreatTemp2 = Cells(j, 11).Value                                                        ' Calculating % increase
 If GreatTemp2 > GreatFinal2 Then
 GreatFinal2 = GreatTemp2
 GreatTic2 = Cells(j, 9).Value                                                          ' Adquiring Ticker
 Else
 End If
 
 
 GreatTemp3 = Cells(j, 11).Value                                                        ' Calculatin % decrease
 If GreatTemp3 < GreatFinal3 Then
 GreatFinal3 = GreatTemp3
 GreatTic3 = Cells(j, 9).Value                                                          ' Adquiring Ticker
 Else
 End If
 
Next j
 
     LastRow = ActiveSheet.Cells(Rows.Count, "K").End(xlUp).Row                              ' Conditional Formating

With Range("K2:K" & LastRow)
    .FormatConditions.Delete
    .FormatConditions.Add Type:=xlCellValue, Operator:=xlGreaterEqual, Formula1:="=0"
    .FormatConditions(1).Interior.Color = RGB(0, 255, 0)
    .FormatConditions.Add Type:=xlCellValue, Operator:=xlLess, Formula1:="=0"
    .FormatConditions(2).Interior.Color = RGB(255, 0, 0)
End With
    
 
 
    Range("Q2").NumberFormat = "00.0%"                                                    ' Writing results for Greatest Values
    Range("Q3").NumberFormat = "00.0%"
    Range("Q4").Value = GreatFinal
    Range("P4").Value = GreatTic
    Range("Q2").Value = GreatFinal2
    Range("P2").Value = GreatTic2
    Range("Q3").Value = GreatFinal3
    Range("P3").Value = GreatTic3
 
   
 
 

 

'Next
 
End Sub

