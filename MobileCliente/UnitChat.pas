unit UnitChat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit,
  FMX.ScrollBox, FMX.Memo;

type
  TFrmChat = class(TForm)
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_notificacao: TImage;
    Line1: TLine;
    rect_prestador: TRectangle;
    c_foto: TCircle;
    Label2: TLabel;
    lv_chat: TListView;
    rect_msg: TRectangle;
    Image1: TImage;
    Memo1: TMemo;
    Rectangle1: TRectangle;
    procedure FormShow(Sender: TObject);
  private
    procedure AddChat(seq_pedido, seq_usuario: Integer; mensagem, dt,
      ind_msg_minha: String);
    procedure ListarChat;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChat: TFrmChat;

implementation

{$R *.fmx}

procedure TFrmChat.AddChat(seq_pedido, seq_usuario : Integer; mensagem, dt, ind_msg_minha : String);
begin
    with lv_Chat.Items.Add do
    begin
        Height    := 44;

        TListItemText(Objects.FindDrawable('TxtMensagem')).Text := mensagem;
        TListItemText(Objects.FindDrawable('TxtData')).Text     := dt;
    end;
end;

procedure TFrmChat.FormShow(Sender: TObject);
begin
    ListarChat;
end;

procedure TFrmChat.ListarChat ;
var
    I : Integer;
begin
    lv_chat.Items.Clear;

    lv_chat.BeginUpdate;

    for I := 1 to 10 do
        if Odd(I) then
            Addchat(I, 0, 'Mensagem de Texto: ' + I.ToString, '15/10 - 09:30hs', 'S')
        else
            Addchat(I, 0, 'Mensagem de Prestador: ' + I.ToString, '15/10 - 09:30hs', 'N');

    lv_chat.EndUpdate;
end;

end.
