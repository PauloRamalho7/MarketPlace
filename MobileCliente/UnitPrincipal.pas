unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.ListBox;

type
  TFrmPrincipal = class(TForm)
    layout_abas: TLayout;
    img_aba1: TImage;
    img_aba2: TImage;
    img_aba3: TImage;
    img_aba4: TImage;
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_notificacao: TImage;
    img_add_pedido: TImage;
    Line1: TLine;
    TabControl: TTabControl;
    TabPedidos: TTabItem;
    TabAceitos: TTabItem;
    TabRealizados: TTabItem;
    TabPerfil: TTabItem;
    lv_pedidos: TListView;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ListBox1: TListBox;
    lbi_endereco: TListBoxItem;
    Label4: TLabel;
    Label5: TLabel;
    Image6: TImage;
    Layout2: TLayout;
    Line2: TLine;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    Image7: TImage;
    Layout3: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Line3: TLine;
    Image8: TImage;
    Layout4: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    Line4: TLine;
    Image9: TImage;
    Layout5: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    Line5: TLine;
    Image10: TImage;
    Layout6: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    Line6: TLine;
    Layout7: TLayout;
    procedure img_notificacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UnitNotificacao;

{$R *.fmx}

procedure TFrmPrincipal.img_notificacaoClick(Sender: TObject);
begin
    if not Assigned(FrmNotificacao) then
        Application.CreateForm(TFrmNotificacao,FrmNotificacao);
    FrmNotificacao.Show
end;

end.
