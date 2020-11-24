unit UnitChat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.ListView, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts;

type
  TFrmChat = class(TForm)
    layout_toolbar: TLayout;
    lbl_titulo: TLabel;
    img_voltar: TImage;
    Line1: TLine;
    Rect_Prestador: TRectangle;
    c_foto: TCircle;
    Label2: TLabel;
    lv_chat: TListView;
    rect_msg: TRectangle;
    edt_login_email: TEdit;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChat: TFrmChat;

implementation

{$R *.fmx}

end.
