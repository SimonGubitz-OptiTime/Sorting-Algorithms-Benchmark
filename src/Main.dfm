object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 596
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 447
    Top = 115
    Width = 35
    Height = 15
    Caption = 'Gr'#246#223'e:'
  end
  object BubblesortHeading: TLabel
    Left = 100
    Top = 320
    Width = 91
    Height = 25
    Caption = 'Bubblesort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object HeapsortHeading: TLabel
    Left = 425
    Top = 320
    Width = 76
    Height = 25
    Caption = 'Heapsort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object InsertionSortHeading: TLabel
    Left = 780
    Top = 320
    Width = 108
    Height = 25
    Caption = 'InsertionSort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object MergesortHeading: TLabel
    Left = 100
    Top = 464
    Width = 87
    Height = 25
    Caption = 'Mergesort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object QuicksortHeading: TLabel
    Left = 425
    Top = 464
    Width = 80
    Height = 25
    Caption = 'Quicksort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object SelectionSortHeading: TLabel
    Left = 780
    Top = 464
    Width = 111
    Height = 25
    Caption = 'SelectionSort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object BubblesortTimeLabel: TLabel
    Left = 100
    Top = 351
    Width = 32
    Height = 15
    Caption = 'Time: '
  end
  object BubblesortReadAccessLabel: TLabel
    Left = 100
    Top = 372
    Width = 82
    Height = 15
    Caption = 'Read Accesses: '
  end
  object BubblesortWriteAccessLabel: TLabel
    Left = 100
    Top = 393
    Width = 73
    Height = 15
    Caption = 'Write Access: '
  end
  object BubblesortTotalAccessLabel: TLabel
    Left = 100
    Top = 414
    Width = 101
    Height = 15
    Caption = 'Total Array Access: '
  end
  object HeapsortTimeLabel: TLabel
    Left = 425
    Top = 351
    Width = 32
    Height = 15
    Caption = 'Time: '
  end
  object HeapsortReadAccessLabel: TLabel
    Left = 425
    Top = 372
    Width = 82
    Height = 15
    Caption = 'Read Accesses: '
  end
  object HeapsortWriteAccessLabel: TLabel
    Left = 425
    Top = 393
    Width = 73
    Height = 15
    Caption = 'Write Access: '
  end
  object HeapsortTotalAccessLabel: TLabel
    Left = 425
    Top = 414
    Width = 101
    Height = 15
    Caption = 'Total Array Access: '
  end
  object InsertionSortTimeLabel: TLabel
    Left = 780
    Top = 351
    Width = 32
    Height = 15
    Caption = 'Time: '
  end
  object InsertionSortReadAccessLabel: TLabel
    Left = 780
    Top = 372
    Width = 82
    Height = 15
    Caption = 'Read Accesses: '
  end
  object InsertionSortWriteAccessLabel: TLabel
    Left = 780
    Top = 393
    Width = 73
    Height = 15
    Caption = 'Write Access: '
  end
  object InsertionSortTotalAccessLabel: TLabel
    Left = 780
    Top = 414
    Width = 101
    Height = 15
    Caption = 'Total Array Access: '
  end
  object MergesortTimeLabel: TLabel
    Left = 100
    Top = 495
    Width = 32
    Height = 15
    Caption = 'Time: '
  end
  object MergesortReadAccessLabel: TLabel
    Left = 100
    Top = 516
    Width = 82
    Height = 15
    Caption = 'Read Accesses: '
  end
  object MergesortWriteAccessLabel: TLabel
    Left = 100
    Top = 537
    Width = 73
    Height = 15
    Caption = 'Write Access: '
  end
  object MergesortTotalAccessLabel: TLabel
    Left = 100
    Top = 558
    Width = 101
    Height = 15
    Caption = 'Total Array Access: '
  end
  object QuicksortTimeLabel: TLabel
    Left = 425
    Top = 495
    Width = 32
    Height = 15
    Caption = 'Time: '
  end
  object QuicksortReadAccessLabel: TLabel
    Left = 425
    Top = 516
    Width = 82
    Height = 15
    Caption = 'Read Accesses: '
  end
  object QuicksortWriteAccessLabel: TLabel
    Left = 425
    Top = 537
    Width = 73
    Height = 15
    Caption = 'Write Access: '
  end
  object QuicksortTotalAccessLabel: TLabel
    Left = 425
    Top = 558
    Width = 101
    Height = 15
    Caption = 'Total Array Access: '
  end
  object SelectionSortTimeLabel: TLabel
    Left = 780
    Top = 495
    Width = 32
    Height = 15
    Caption = 'Time: '
  end
  object SelectionSortReadAccessLabel: TLabel
    Left = 780
    Top = 516
    Width = 82
    Height = 15
    Caption = 'Read Accesses: '
  end
  object SelectionSortWriteAccessLabel: TLabel
    Left = 780
    Top = 537
    Width = 73
    Height = 15
    Caption = 'Write Access: '
  end
  object SelectionSortTotalAccessLabel: TLabel
    Left = 780
    Top = 558
    Width = 101
    Height = 15
    Caption = 'Total Array Access: '
  end
  object StartButton: TButton
    Left = 470
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Starten'
    Enabled = False
    TabOrder = 0
    OnClick = StartButtonClick
  end
  object AmountInput: TEdit
    Left = 447
    Top = 136
    Width = 121
    Height = 23
    TabOrder = 1
    TextHint = '150000'
    OnChange = AmountInputChange
  end
end
