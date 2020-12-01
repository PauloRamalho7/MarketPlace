unit UnitPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
  FMX.ListBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrmPedido = class(TForm)
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_notificacao: TImage;
    Line1: TLine;
    rect_abas: TRectangle;
    rect_aba1: TRectangle;
    lbl_aba1: TLabel;
    rect_aba2: TRectangle;
    lbl_aba2: TLabel;
    TabControl: TTabControl;
    TabPedido: TTabItem;
    TabOrcamentos: TTabItem;
    ListBox1: TListBox;
    lbi_endereco: TListBoxItem;
    Image9: TImage;
    Layout2: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Line2: TLine;
    ListBoxItem2: TListBoxItem;
    Image11: TImage;
    Layout4: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    Line3: TLine;
    ListBoxItem3: TListBoxItem;
    Image12: TImage;
    Layout5: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    Line4: TLine;
    ListBoxItem4: TListBoxItem;
    Image13: TImage;
    Layout6: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    Line5: TLine;
    ListBoxItem1: TListBoxItem;
    Image10: TImage;
    Layout3: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    ListBoxItem5: TListBoxItem;
    Rectangle2: TRectangle;
    Label2: TLabel;
    lv_orcamentos: TListView;
    img_aprovar: TImage;
    img_chat: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rect_aba1Click(Sender: TObject);
    procedure rect_aba2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_notificacaoClick(Sender: TObject);
  private
    procedure AddOrcamento(seq_orcamento, seq_usuario: Integer; foto64, nome,
                           dt: String; valor: Double);
    procedure ListarOrcamento;
    procedure MudarAba(Indice: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

uses
    UnitPrincipal;

{$R *.fmx}

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmPedido := nil;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
    MudarAba(0);
    ListarOrcamento;
end;

procedure TFrmPedido.img_notificacaoClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmPedido.AddOrcamento(seq_orcamento, seq_usuario : Integer;
                                  foto64, nome, dt : String;
                                  valor: Double);
begin
    with lv_orcamentos.Items.Add do
    begin
        Tag       := seq_orcamento;
        TagString := seq_usuario.ToString;

        Height    := 80;

        //Foto Base64
        if foto64 <> '' then
            TListItemImage(Objects.FindDrawable('ImgIcone')).Bitmap := FrmPrincipal.BitmapFromBase64(foto64);

        TListItemText(Objects.FindDrawable('TxtNome')).Text       := nome;
        TListItemText(Objects.FindDrawable('TxtData')).Text       := dt;
        TListItemText(Objects.FindDrawable('TxtValor')).Text      := FormatFloat('#,##0.00', valor);
        TListItemImage(Objects.FindDrawable('ImgAprovar')).Bitmap := img_aprovar.Bitmap;
        TListItemImage(Objects.FindDrawable('ImgChat')).Bitmap    := img_chat.Bitmap;
    end;
end;

procedure TFrmPedido.ListarOrcamento ;
var
    I : Integer;
begin
    lv_orcamentos.Items.Clear;

    for I := 1 to 10 do
        Addorcamento(I, 0, '', 'Paulo Ramalho', '20/10',  150.25*I);



end;

procedure TFrmPedido.MudarAba(Indice: Integer);
begin
    //Reset fundo branco
    rect_aba1.Fill.Color := $FFFFFFFF;
    lbl_aba1.FontColor   := $FFADADAD;
    rect_aba2.Fill.Color := $FFFFFFFF;
    lbl_aba2.FontColor   := $FFADADAD;

    if Indice=0 then
    begin
        rect_aba1.Fill.Color := $FF1878F3;
        lbl_aba1.FontColor   := $FFFFFFFF;
    end else
    begin
        rect_aba2.Fill.Color := $FF1878F3;
        lbl_aba2.FontColor   := $FFFFFFFF;
    end;

    TabControl.GotoVisibleTab(Indice,TTabTransition.Slide);


end;

procedure TFrmPedido.rect_aba1Click(Sender: TObject);
begin
    MudarAba(TRectangle(Sender).Tag);;
end;

procedure TFrmPedido.rect_aba2Click(Sender: TObject);
begin
    MudarAba(TRectangle(Sender).Tag);
end;

end.
