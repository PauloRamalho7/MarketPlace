unit UnitPrincipal;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListBox,
  FMX.ListView,
  FMX.ListView.Adapters.Base,
  FMX.ListView.Appearances,
  FMX.ListView.Types,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.TextLayout,
  FMX.Types,

  System.Classes,
  System.NetEncoding,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmPrincipal = class(TForm)
    layout_abas: TLayout;
    img_aba1: TImage;
    img_aba2: TImage;
    img_aba3: TImage;
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_notificacao: TImage;
    img_add_pedido: TImage;
    TabControl: TTabControl;
    TabPedidos: TTabItem;
    TabAceitos: TTabItem;
    TabRealizados: TTabItem;
    TabPerfil: TTabItem;
    lv_pedidos: TListView;
    Line1: TLine;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    ListBox1: TListBox;
    lbi_endereco: TListBoxItem;
    Label4: TLabel;
    Label5: TLabel;
    Image9: TImage;
    Layout2: TLayout;
    ListBoxItem2: TListBoxItem;
    Image11: TImage;
    Layout4: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    ListBoxItem3: TListBoxItem;
    Image12: TImage;
    Layout5: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    ListBoxItem4: TListBoxItem;
    Image13: TImage;
    Layout6: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    ListBoxItem1: TListBoxItem;
    Image10: TImage;
    Layout3: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line5: TLine;
    Layout7: TLayout;
    img_aba4: TImage;
    img_barra_fundo: TImage;
    img_barra_progresso: TImage;
    lv_aceitos: TListView;
    img_user: TImage;
    img_money: TImage;
    lv_realizados: TListView;
    procedure img_notificacaoClick(Sender: TObject);
    procedure img_add_pedidoClick(Sender: TObject);
    procedure img_aba1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lv_pedidosUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Circle1Click(Sender: TObject);
  private
    procedure MudarAba(img : TImage);
    procedure AddPedido(seq_pedido, seq_usuario, max_orcamentos, qtd_orc_enviada: Integer;
                        categoria, dt, UnitPedido, descricao: String);
    procedure ListarPedido;

    procedure AddAceito(seq_pedido, seq_usuario : Integer; nome, Categoria, dt, Pedido,
                        descricao : String; valor : Double);
    procedure ListarAceito;
    procedure AddRealizado(seq_pedido, seq_usuario: Integer; nome, Categoria,
      dt, Pedido, descricao: String; valor: Double);
    procedure ListarRealizado;
    { Private declarations }
  public
    function Base64FromBitmap(Bitmap: TBitmap): string;
    function BitmapFromBase64(const base64: string): TBitmap;
    function GetTextHeight(const D: TListItemText; const Width: single;
                           const Text: string): Integer;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitNotificacao, UnitPedido, UnitChat;

procedure TFrmPrincipal.MudarAba(img : TImage);
begin
   img_aba1.Opacity := 0.3;
   img_aba2.Opacity := 0.3;
   img_aba3.Opacity := 0.3;
   img_aba4.Opacity := 0.3;

   img.Opacity := 1;

   TabControl.GotoVisibleTab(img.Tag, TTabTransition.Slide);
end;

function TFrmPrincipal.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
  Encoding: TBase64Encoding;
begin
        Input := TBytesStream.Create;
        try
                Bitmap.SaveToStream(Input);
                Input.Position := 0;
                Output := TStringStream.Create('', TEncoding.ASCII);

                try
                    Encoding := TBase64Encoding.Create(0);
                    Encoding.Encode(Input, Output);
                    Result := Output.DataString;
                finally
                        Encoding.Free;
                        Output.Free;
                end;

        finally
                Input.Free;
        end;
end;

function TFrmPrincipal.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
  Encoding: TBase64Encoding;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Encoding := TBase64Encoding.Create(0);
      Encoding.Decode(Input, Output);

      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Encoding.DisposeOf;
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TFrmPrincipal.Circle1Click(Sender: TObject);
begin
    if NOT Assigned(FrmChat) then
        Application.CreateForm(TFrmChat, FrmChat);

    FrmChat.Show;

end;

function TFrmPrincipal.GetTextHeight(const D: TListItemText; const Width: single; const Text: string): Integer;
var
  Layout: TTextLayout;
begin
  // Create a TTextLayout to measure text dimensions
  Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      // Initialize layout parameters with those of the drawable
      Layout.Font.Assign(D.Font);
      Layout.VerticalAlign := D.TextVertAlign;
      Layout.HorizontalAlign := D.TextAlign;
      Layout.WordWrap := D.WordWrap;
      Layout.Trimming := D.Trimming;
      Layout.MaxSize := TPointF.Create(Width, TTextLayout.MaxLayoutSize.Y);
      Layout.Text := Text;
    finally
      Layout.EndUpdate;
    end;
    // Get layout height
    Result := Round(Layout.Height);
    // Add one em to the height
    Layout.Text := 'm';
    Result := Result + Round(Layout.Height);
  finally
    Layout.Free;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    TabControl.ActiveTab := TabPedidos;
    ListarPedido;
    ListarAceito;
    ListarRealizado;
end;

procedure TFrmPrincipal.AddPedido(seq_pedido, seq_usuario, max_orcamentos, qtd_orc_enviada : Integer;
                                  categoria, dt, UnitPedido, descricao : String);
begin
    with lv_pedidos.Items.Add do
    begin
        Tag       := seq_pedido;
        TagString := seq_usuario.ToString;

        Height    := 180;


        TListItemText(Objects.FindDrawable('TxtCategoria')).Text      := categoria;
        TListItemText(Objects.FindDrawable('TxtData')).Text           := dt;
        TListItemText(Objects.FindDrawable('TxtPedido')).Text         := 'Pedido #' + Seq_pedido.ToString;
        TListItemText(Objects.FindDrawable('TxtDescricao')).Text      := descricao;
        TListItemText(Objects.FindDrawable('TxtOrcamentos')).Text     := 'Orçamentos Recebidos ('+qtd_orc_enviada.ToString+
                                                                         '/'+max_orcamentos.ToString+')';
        TListItemImage(Objects.FindDrawable('ImgFundo')).Width        := lv_pedidos.Width - 20;
        TListItemImage(Objects.FindDrawable('ImgFundo')).Bitmap       := img_barra_fundo.Bitmap;
        TListItemImage(Objects.FindDrawable('ImgFundo')).TagFloat     := max_orcamentos;
        TListItemImage(Objects.FindDrawable('ImgProgresso')).TagFloat := qtd_orc_enviada;
        TListItemImage(Objects.FindDrawable('ImgProgresso')).Bitmap   := img_barra_progresso.Bitmap;
        TListItemImage(Objects.FindDrawable('ImgProgresso')).Width    := (qtd_orc_enviada/ max_orcamentos) *
                                                                         TListItemImage(Objects.FindDrawable('ImgFundo')).Width;

        TListItemImage(Objects.FindDrawable('ImgProgresso')).PlaceOffset.Y := TListItemImage(Objects.FindDrawable('ImgFundo')).PlaceOffset.Y;
    end;
end;


procedure TFrmPrincipal.AddAceito(seq_pedido, seq_usuario : Integer;
                                  nome, Categoria, dt, Pedido, descricao : String;
                                  valor : Double);
begin
    with lv_aceitos.Items.Add do
    begin
        Tag       := seq_pedido;
        TagString := seq_usuario.ToString;

        Height    := 190;

        TListItemText(Objects.FindDrawable('TxtCategoria')).Text := categoria;
        TListItemText(Objects.FindDrawable('TxtData')).Text      := dt;
        TListItemText(Objects.FindDrawable('TxtPedido')).Text    := 'Pedido #' +pedido;
        TListItemText(Objects.FindDrawable('TxtDescricao')).Text := descricao;
        TListItemText(Objects.FindDrawable('TxtNome')).Text      := nome;
        TListItemText(Objects.FindDrawable('TxtValor')).Text     := Format('%.2m', [valor]);

        TListItemImage(Objects.FindDrawable('ImgNome')).Bitmap   := img_user.Bitmap;
        TListItemImage(Objects.FindDrawable('ImgValor')).Bitmap  := img_money.Bitmap;
    end;
end;

procedure TFrmPrincipal.AddRealizado(seq_pedido, seq_usuario : Integer;
                                     nome, Categoria, dt, Pedido, descricao : String;
                                     valor : Double);
begin
    with lv_realizados.Items.Add do
    begin
        Tag       := seq_pedido;
        TagString := seq_usuario.ToString;

        Height    := 190;

        TListItemText(Objects.FindDrawable('TxtCategoria')).Text := categoria;
        TListItemText(Objects.FindDrawable('TxtData')).Text      := dt;
        TListItemText(Objects.FindDrawable('TxtPedido')).Text    := 'Pedido #' +pedido;
        TListItemText(Objects.FindDrawable('TxtDescricao')).Text := descricao;
        TListItemText(Objects.FindDrawable('TxtNome')).Text      := nome;
        TListItemText(Objects.FindDrawable('TxtValor')).Text     := Format('%.2m', [valor]);

        TListItemImage(Objects.FindDrawable('ImgNome')).Bitmap   := img_user.Bitmap;
        TListItemImage(Objects.FindDrawable('ImgValor')).Bitmap  := img_money.Bitmap;
    end;
end;


procedure TFrmPrincipal.ListarPedido ;
var
    I : Integer;
begin
    lv_pedidos.Items.Clear;

    lv_pedidos.BeginUpdate;

    for I := 1 to 10 do
        AddPedido(I, 0, 10, I, 'Serviços Domésticos  - Limpeza',
                 '15/10',  (150.25+I).ToString,
                 'Preciso de uma diarista que saia com os cachorros e faça almoço sdf dsafds fdsafddf');

    lv_pedidos.EndUpdate;
end;


procedure TFrmPrincipal.lv_pedidosUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
    qtd_orc_enviada,  max_orcamentos : Double;
    txt,txt_orc : TListItemText ;
begin
    qtd_orc_enviada := TListItemImage(AItem.Objects.FindDrawable('ImgProgresso')).TagFloat;
    max_orcamentos  := TListItemImage(AItem.Objects.FindDrawable('ImgFundo')).TagFloat;

    //Calcula Tamanho Campo Categoria
    txt := TListItemText(AItem.Objects.FindDrawable('TxtCategoria'));
    txt.Width := lv_pedidos.Width - 105;

    // Calcula tamanho campo descrição
    txt := TListItemText(AItem.Objects.FindDrawable('TxtDescricao'));
    txt.Width  := lv_pedidos.Width - 30;
    txt.Height := GetTextHeight(txt, txt.Width, txt.Text);

    //Calcula posicao do Texto de Orçamentos
    txt_orc := TListItemText(AItem.Objects.FindDrawable('TxtOrcamentos'));
    txt_orc.PlaceOffset.Y := txt.PlaceOffset.Y + txt.Height + 10;

    if lv_pedidos.Width < 250 then
        txt_orc.Text := 'Orç. Receb. ('
    else
        txt_orc.Text := 'Orçamentos Recebidos (';
    txt_orc.Text := txt_orc.Text + qtd_orc_enviada.ToString + ' / ' + max_orcamentos.ToString + ')';

    //calcula barra de progresso
    TListItemImage(AItem.Objects.FindDrawable('ImgFundo')).PlaceOffset.Y := txt_orc.PlaceOffset.Y + txt_orc.Height + 10;

    TListItemImage(AItem.Objects.FindDrawable('ImgFundo')).Width      := lv_pedidos.Width - 30;
    TListItemImage(AItem.Objects.FindDrawable('ImgProgresso')).Width  := (qtd_orc_enviada/ max_orcamentos) *
                                                                        TListItemImage(AItem.Objects.FindDrawable('ImgFundo')).Width;
    TListItemImage(AItem.Objects.FindDrawable('ImgProgresso')).PlaceOffset.Y := TListItemImage(AItem.Objects.FindDrawable('ImgFundo')).PlaceOffset.Y;

    AItem.Height := Trunc(TListItemImage(AItem.Objects.FindDrawable('ImgFundo')).PlaceOffset.Y + 25);
end;

procedure TFrmPrincipal.ListarAceito ;
var
    I : Integer;
begin
    lv_aceitos.Items.Clear;

    lv_aceitos.BeginUpdate;

    for I := 1 to 10 do
        AddAceito(I, 0, 'Paulo Ramalho', 'Serviços Domésticos  - Limpeza',
                 '15/10',  (150.25+I).ToString,
                 'Preciso de uma diarista que saia com os cachorros e faça almoço sdf dsafds fdsafddf',
                 I * 12.25);

    lv_aceitos.EndUpdate;
end;

procedure TFrmPrincipal.ListarRealizado ;
var
    I : Integer;
begin
    lv_realizados.Items.Clear;

    lv_realizados.BeginUpdate;

    for I := 1 to 10 do
        AddRealizado(I, 0, 'João Silva', 'Serviços Domésticos  - PET',
                 '15/11',  (250+I).ToString,
                 'Preciso de uma diarista que saia com os cachorros e faça almoço sdf dsafds fdsafddf',
                 I * 10.33);

    lv_realizados.EndUpdate;
end;

procedure TFrmPrincipal.img_aba1Click(Sender: TObject);
begin
    MudarAba(TImage(Sender));
end;

procedure TFrmPrincipal.img_add_pedidoClick(Sender: TObject);
begin
    if NOT Assigned(FrmPedido) then
        Application.CreateForm(TFrmPedido, FrmPedido);

    FrmPedido.Show;
end;

procedure TFrmPrincipal.img_notificacaoClick(Sender: TObject);
begin
    if NOT Assigned(FrmNotificacao) then
        Application.CreateForm(TFrmNotificacao, FrmNotificacao);

    FrmNotificacao.Show;
end;

end.
