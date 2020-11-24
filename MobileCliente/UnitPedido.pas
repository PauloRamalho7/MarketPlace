unit UnitPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.ListBox, FMX.TabControl;

type
  TFrmPedido = class(TForm)
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_voltar: TImage;
    Line1: TLine;
    Rect_Abas: TRectangle;
    rect_conta_finalizar: TRectangle;
    Label25: TLabel;
    Rectangle1: TRectangle;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabPedido: TTabItem;
    TabOrçamento: TTabItem;
    ListBox1: TListBox;
    lbi_endereco: TListBoxItem;
    Layout2: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Line2: TLine;
    ListBoxItem1: TListBoxItem;
    Layout3: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Line3: TLine;
    ListBoxItem2: TListBoxItem;
    Layout4: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    Line4: TLine;
    ListBoxItem3: TListBoxItem;
    Layout5: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    Line5: TLine;
    ListBoxItem4: TListBoxItem;
    Layout6: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    Line6: TLine;
    ListBoxItem5: TListBoxItem;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Image6: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    lv_orcamentos: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.fmx}

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action    := TCloseAction.caFree;
    FrmPedido := nil;
end;

end.
