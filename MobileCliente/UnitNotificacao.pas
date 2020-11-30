unit UnitNotificacao;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListView,
  FMX.ListView.Adapters.Base,
  FMX.ListView.Appearances,
  FMX.ListView.Types,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmNotificacao = class(TForm)
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_voltar_notif: TImage;
    img_refresh: TImage;
    Line1: TLine;
    lv_notificacoes: TListView;
    img_delete: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img_refreshClick(Sender: TObject);
    procedure img_voltar_notifClick(Sender: TObject);
  private
    procedure AddNotificacao(seq_notificacao, seq_orcamento: Integer; foto64, nome, dta,
      mensagem: string);
    procedure ListarNotificacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNotificacao: TFrmNotificacao;

implementation

uses
    UnitPrincipal;

{$R *.fmx}

procedure TFrmNotificacao.AddNotificacao(seq_notificacao, seq_orcamento : Integer;
                                         foto64, nome, dta, mensagem : String);
begin
    with lv_notificacoes.Items.Add do
    begin
        Tag       := seq_notificacao;
        TagString := seq_orcamento.ToString;

        Height    := 80;

        //Foto Base64
        if foto64 <> '' then
            TListItemImage(Objects.FindDrawable('ImgIcone')).Bitmap := FrmPrincipal.BitmapFromBase64(foto64);

        TListItemText(Objects.FindDrawable('TxtNome')).Text       := nome;
        TListItemText(Objects.FindDrawable('TxtMensagem')).Text   := mensagem;
        TListItemText(Objects.FindDrawable('TxtData')).Text       := dta;
        TListItemImage(Objects.FindDrawable('ImgExcluir')).Bitmap := img_delete.Bitmap;
    end;
end;

procedure TFrmNotificacao.ListarNotificacao;
var
    I : Integer;
begin
    lv_notificacoes.Items.Clear;
    for I := 1 to 10 do
        AddNotificacao(I, I+1, '', 'Paulo Ramalho', '20/10', 'Mensagem: ' + I.ToString);



end;

procedure TFrmNotificacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmNotificacao := nil;
end;

procedure TFrmNotificacao.img_voltar_notifClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmNotificacao.img_refreshClick(Sender: TObject);
begin
    ListarNotificacao;
end;

end.
