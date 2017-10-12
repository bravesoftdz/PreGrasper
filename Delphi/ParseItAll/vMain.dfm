object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'Parse It All!'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  TransparentColorValue = clNone
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splJobBrowser: TSplitter
    Left = 0
    Top = 233
    Width = 554
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitTop = 171
    ExplicitWidth = 119
  end
  object pnlJobs: TPanel
    Left = 0
    Top = 73
    Width = 554
    Height = 160
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object strgrdJobs: TZColorStringGrid
      Left = 0
      Top = 0
      Width = 554
      Height = 160
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 18
      DefaultDrawing = False
      DoubleBuffered = True
      FixedColor = clBtnFace
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentDoubleBuffered = False
      TabOrder = 0
      DefaultCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultCellStyle.Font.Color = clWindowText
      DefaultCellStyle.Font.Height = -11
      DefaultCellStyle.Font.Name = 'Tahoma'
      DefaultCellStyle.Font.Style = []
      DefaultCellStyle.BGColor = clWindow
      DefaultFixedCellStyle.Font.Charset = DEFAULT_CHARSET
      DefaultFixedCellStyle.Font.Color = clWindowText
      DefaultFixedCellStyle.Font.Height = -11
      DefaultFixedCellStyle.Font.Name = 'Tahoma'
      DefaultFixedCellStyle.Font.Style = []
      DefaultFixedCellStyle.BGColor = clBtnFace
      LineDesign.LineUpColor = clWhite
      ColWidths = (
        35
        318
        59
        55)
      RowHeights = (
        18
        18)
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    object btnCreateJob: TSpeedButton
      Left = 24
      Top = 4
      Width = 33
      Height = 22
      Action = acCreateJob
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000333333000000
        0000000000000000000000000000000000000000000000000000000303032525
        25818181F7F7F7FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
        F5F5353535575757D4D4D4FBFBFBD3D3D3535353393939F7F7F7000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878575757FFFFFFFFFFFF000000FFFF
        FFFFFFFF5353537E7E7E000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B
        1B1BD6D6D6FFFFFFFFFFFF000000FFFFFFFFFFFFD3D3D3212121000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFD000000FCFCFC0000000000000000000000
        00000000FBFBFB030303000000000000FFFFFF00000000000000000000000000
        0000D8D8D8FFFFFFFFFFFF000000FFFFFFFFFFFFD4D4D4212121000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777775B5B5BFFFFFFFFFFFF000000FFFF
        FFFFFFFF5757577D7D7D000000000000FFFFFF00000000000000000000000000
        00000000005B5B5BD8D8D8FCFCFCD6D6D6575757363636F5F5F5000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F57979791D1D1D0101010000
        007A7A7AF5F5F5FFFFFF000000000000FFFFFF00000000000000000000000000
        0000000000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFF000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000FFFFFFFFFFFFFFFFFF020202E8E8E8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFF6B6B6B05050503030303030303030303030303030303
        0303030303030303030303000000030303FFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
    end
    object btnEditJob: TBitBtn
      Left = 8
      Top = 32
      Width = 41
      Height = 25
      Caption = 'btnEditJob'
      TabOrder = 0
      OnClick = btnEditJobClick
    end
    object btnEditRules: TBitBtn
      Left = 55
      Top = 3
      Width = 74
      Height = 25
      Caption = 'btnEditRules'
      TabOrder = 1
      OnClick = btnEditRulesClick
    end
    object btnGo: TBitBtn
      Left = 151
      Top = 3
      Width = 50
      Height = 25
      Caption = 'btnGo'
      TabOrder = 2
      OnClick = btnGoClick
    end
    object btnClear: TButton
      Left = 344
      Top = 3
      Width = 57
      Height = 25
      Caption = 'btnClear'
      TabOrder = 3
      OnClick = btnClearClick
    end
    object btnSaveToCSV: TBitBtn
      Left = 407
      Top = 3
      Width = 59
      Height = 25
      Caption = 'btnSaveToCSV'
      TabOrder = 4
      OnClick = btnSaveToCSVClick
    end
    object btnCopy: TBitBtn
      Left = 472
      Top = 3
      Width = 75
      Height = 25
      Caption = 'btnCopy'
      Enabled = False
      TabOrder = 5
      OnClick = btnCopyClick
    end
    object btnTest: TButton
      Left = 472
      Top = 34
      Width = 75
      Height = 25
      Caption = 'btnTest'
      Enabled = False
      TabOrder = 6
      OnClick = btnTestClick
    end
    object btnStop: TBitBtn
      Left = 207
      Top = 3
      Width = 50
      Height = 25
      Caption = 'btnStop'
      TabOrder = 7
      OnClick = btnStopClick
    end
  end
  object chrmBrowser: TChromium
    Left = 0
    Top = 236
    Width = 554
    Height = 54
    Align = alClient
    DefaultUrl = 'about:blank'
    TabOrder = 2
    Options.ImageLoading = STATE_DISABLED
    Options.Webgl = STATE_DISABLED
  end
  object mmMenu: TMainMenu
    Images = ilIcons
    Left = 356
    Top = 150
    object mniProject: TMenuItem
      Caption = 'Projects'
      object mniNewProject: TMenuItem
        Action = acCreateJob
        Caption = 'New Project'
      end
    end
    object mniService: TMenuItem
      Caption = 'Service'
      object mniVacuumCommand: TMenuItem
        Caption = 'Vacuum Command'
        OnClick = mniVacuumCommandClick
      end
      object mniClearSequences: TMenuItem
        Caption = 'Clear Sequences'
        OnClick = mniClearSequencesClick
      end
    end
  end
  object xpmnfstXP: TXPManifest
    Left = 505
    Top = 150
  end
  object ilIcons: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 456
    Top = 150
    Bitmap = {
      494C0101010008004C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000323232FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0202
      02FF242424FF818181FFF7F7F7FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000F5F5F5FF343434FF565656FFD4D4D4FFFBFB
      FBFFD3D3D3FF525252FF383838FFF7F7F7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000777777FF565656FF00000000000000000000
      00FF0000000000000000525252FF7D7D7DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00000000000000000000000000001A1A1AFFD6D6D6FF00000000000000000000
      00FF0000000000000000D3D3D3FF202020FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00000000000000000000FDFDFDFF000000FFFCFCFCFF000000FF000000FF0000
      00FF000000FF000000FFFBFBFBFF020202FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00FF000000FF000000FF000000FF000000FFD8D8D8FF00000000000000000000
      00FF0000000000000000D4D4D4FF202020FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000767676FF5A5A5AFF00000000000000000000
      00FF0000000000000000565656FF7C7C7CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00FF000000FF000000FF000000FF000000FF000000FF5A5A5AFFD8D8D8FFFCFC
      FCFFD6D6D6FF565656FF353535FFF5F5F5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000F5F5F5FF787878FF1C1C1CFF0000
      00FF000000FF797979FFF5F5F5FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010101FFE8E8E8FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6AFF040404FF020202FF0202
      02FF020202FF020202FF020202FF020202FF020202FF020202FF020202FF0000
      00FF020202FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object actlstMain: TActionList
    Left = 408
    Top = 150
    object acCreateJob: TAction
      Hint = 'New Project'
      ImageIndex = 0
      OnExecute = acCreateJobExecute
    end
  end
  object tmrJobsGridUpdate: TTimer
    Interval = 2500
    OnTimer = tmrJobsGridUpdateTimer
    Left = 40
    Top = 155
  end
end
