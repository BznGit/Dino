unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Gestures,
  FMX.ListBox, FMX.Effects, System.Generics.Collections;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer2: TTimer;
    Image3: TImage;
    Label1: TLabel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Image7: TImage;
    Image8: TImage;
    Timer3: TTimer;
    Timer1: TTimer;
    RecDinoA: TRectangle;
    RecK1A: TRectangle;
    RecDinoB: TRectangle;
    GestureManager1: TGestureManager;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Panel1: TPanel;
    StyleBook1: TStyleBook;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Button1: TButton;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    Panel3: TPanel;
    Button2: TButton;
    ShadowEffect3: TShadowEffect;
    Image9: TImage;
    Image10: TImage;
    RecK2A: TRectangle;
    RecK2B: TRectangle;
    RecK1B: TRectangle;
    Image11: TImage;
    RecK3B: TRectangle;
    RecK3A: TRectangle;
    Image12: TImage;
    RecPtirB: TRectangle;
    RecPtirA: TRectangle;
    Timer4: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Panel1Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SetObjects;
    procedure Timer4Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  var
    Form2: TForm2;
    i, j, s, schet, skorost, k, cts, kuktus, hig, NumPr,
    diap, diap1, ii, slojnost                           : integer;
    strt, cactus, esc                                   : boolean;
    xOtj, Y0, Y1, Y2, Y30pt, Y31pt, Y32pt, scaleX,
    scaleY, formW                                       : single;
    ImageList                                           : TObjectList<TImage>;
    RecList1, RecList2                                  : TObjectList<TRectangle>;
    ColorMas                                            : array[0..5]  of cardinal;
  const   Hpryjka=13; // ������ ������
implementation

{$R *.fmx}

// ������ ��������� ------------------------------------------------------------
procedure TForm2.FormCreate(Sender: TObject);
begin
  formW:=form2.Width;
  strt:=false;
  label5.Text:='Version 1.0.1'+#10 +'2020';
  label3.Text:='Points: 0';
  label1.Text:='0 meters';
  timer1.Enabled:=false;
  label2.Visible:=false;

  schet:=0;
  kuktus:=0;
  diap1:=0;
  i:=0;
  s:=0;
  cts:=0;
  esc:=false;
  hig:=kuktus;
  slojnost:=28;
  ImageList := TObjectList<TImage>.Create;
  RecList1  := TObjectList<TRectangle>.Create;
  RecList2  := TObjectList<TRectangle>.Create;
  // 0
  ImageList.Add(Image3);
  RecList1.Add(RecK1A);
  RecList2.Add(RecK1B);
  // 1
  ImageList.Add(Image10);
  RecList1.Add(RecK2A);
  RecList2.Add(RecK2B);
  // 2
  ImageList.Add(Image11);
  RecList1.Add(RecK3A);
  RecList2.Add(RecK3B);
  // 3
  ImageList.Add(Image12);
  RecList1.Add(RecPtirA);
  RecList2.Add(RecPtirB);

  SetObjects;

  NumPr:=0;
  ImageList[NumPr].Visible:=true;
  //RecList1[NumPr].Visible:=true;
  //RecList2[NumPr].Visible:=true;
  //form2.Fill.Color:=TAlphaColorRec. Aquamarine;
  ColorMas[0]:=4294967295;  // white;
  ColorMas[3]:=4294901760;  // red
  ColorMas[1]:=4294967040;  //yello
  ColorMas[4]:=4278190335; // blue
  ColorMas[2]:=4294944000;  // orange
  ColorMas[5]:=4285048345;   //dimgray
  ii:=0;
  panel3.Visible:=true;
end;

// ��������� ���������� ����������� --------------------------------------------
procedure TForm2.SetObjects;
begin
  label5.Text:=' Version 1.0.0'+#10 +'2020' +#10 +'by' +#10 + 'Alex Ashkinazi';

  scaleX:=form2.Width/15;
  scaleY:=form2.Height/15;

  image2.Position.X:= 0;
  image2.Position.Y:= form2.Height - 4*scaleY;
  image2.Width:=form2.Width;

  // ����-������ ---------------------------------------------------------------
  image1.Position.X:= form2.Width - 14*scaleX;
  image1.Position.Y:= (image2.Position.Y+image2.Height/2-image1.Height);

  RecDinoA.Position.X:= form2.Width - 14*scaleX+30;
  RecDinoA.Position.Y:= (image2.Position.Y+image2.Height/2-RecDinoA.Height);

  RecDinoB.Position.X:= form2.Width - 14*scaleX+15;
  RecDinoB.Position.Y:= RecDinoA.Position.Y-RecDinoB.Height;

  // 0-� ������ ----------------------------------------------------------------
  ImageList[0].Position.X:=form2.Width - 2*scaleX;
  ImageList[0].Position.Y:= image2.Position.Y + image2.Height/2 - ImageList[0].Height;


  RecList1[0].Position.X:=ImageList[0].Position.X + 5;
  RecList1[0].Position.Y:=ImageList[0].Position.Y + ImageList[0].Height - RecList1[0].Height;

  RecList2[0].Position.X:=RecList1[0].Position.X + RecList1[0].Width;
  RecList2[0].Position.Y:=RecList1[0].Position.Y + RecList1[0].Height - RecList2[0].Height;

  // 1-� ������ ----------------------------------------------------------------
  ImageList[1].Position.X:=form2.Width - 2*scaleX;
  ImageList[1].Position.Y:= image2.Position.Y + image2.Height/2 - ImageList[1].Height;

  RecList1[1].Position.X:=ImageList[1].Position.X + 5;
  RecList1[1].Position.Y:=ImageList[1].Position.Y + ImageList[1].Height - RecList1[1].Height;

  RecList2[1].Position.X:=RecList1[1].Position.X +8;
  RecList2[1].Position.Y:=RecList1[1].Position.Y + RecList1[1].Height - RecList1[1].Height - RecList2[1].Height;

  // 2-� ������ ----------------------------------------------------------------
  ImageList[2].Position.X:=form2.Width - 2*scaleX;
  ImageList[2].Position.Y:= image2.Position.Y + image2.Height/2 - ImageList[2].Height;

  RecList1[2].Position.X:=ImageList[2].Position.X + 6;
  RecList1[2].Position.Y:=image2.Position.Y + image2.Height/2 - RecList1[2].Height;

  RecList2[2].Position.X:=RecList1[2].Position.X + 18;
  RecList2[2].Position.Y:=RecList1[2].Position.Y  - RecList2[2].Height;

  // 3-� ������ ----------------------------------------------------------------
  ImageList[3].Position.X:=form2.Width - 2*scaleX;
  ImageList[3].Position.Y:= ImageList[3].Height/2;
  Y30pt:=ImageList[3].Position.Y;

  RecList1[3].Position.X:=ImageList[3].Position.X;
  RecList1[3].Position.Y:=ImageList[3].Position.Y+RecList1[3].Height;
  Y31pt:=RecList1[3].Position.Y;

  RecList2[3].Position.X:=RecList1[3].Position.X + 45;
  RecList2[3].Position.Y:=RecList1[3].Position.Y  + RecList1[3].Height;
  Y32pt:=RecList2[3].Position.Y;
end;

// ����� -----------------------------------------------------------------------
procedure TForm2.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
 var
  i: integer;
begin
   // ���� ---------------------------------------------------------------------
  if eventinfo.GestureID=igilongtap  then
  begin
    Panel1.Visible:=true;
  end;

   if  (eventinfo.GestureID=igidoubletap) and (strt=false) then  exit;
  // ������ �������� ---------------------------------------------------------
  if (label2.Visible=false) and (strt=false) and (eventinfo.GestureID=sgiup)  then
  begin
     timer1.Enabled:=true;
     strt:=true;
     timer3.Enabled:=true;
     schet:=0;
     i:=0;
     s:=0;
     cactus:=false;
     skorost:=5;
     panel3.Visible:=false;
  end;
  // ���������� ����� ----------------------------------------------------------
  if (esc=false) and (form2.label2.Visible=false) and (eventinfo.GestureID=igidoubletap)  then
  begin
    esc:=true;
    timer1.Enabled:=false;
    timer3.Enabled:=false;
    image1.Bitmap.Assign(image1.MultiResBitmap.Items[0].Bitmap);
    exit;
  end;
    // ������� ����� -----------------------------------------------------------
  If  (esc=true) and (form2.label2.Visible=false) and (eventinfo.GestureID=igidoubletap) then
  begin
    esc:=false;
    strt:=true;
    timer1.Enabled:=true;
    timer3.Enabled:=true;
  end;
  // ����� ---------------------------------------------------------------------
    if  (form2.label2.Visible=true) and (eventinfo.GestureID=igidoubletap)  then
  begin
    hig:=kuktus;
    image1.Position.X:= form2.Width - 14*scaleX;
    image1.Position.Y:= (image2.Position.Y+image2.Height/2-image1.Height);

    SetObjects;

    timer1.Interval:=50;
    cactus:=false;
    label2.Visible:=false;
    ImageList[NumPr].Visible:=false;
    timer1.Enabled:=true;
    strt:=true;
    timer3.Enabled:=true;
    label1.Text:='0';
    schet:=0;
    i:=0;
    s:=0;
    k:=1;
    ii:=0;
    kuktus:=0;
    diap1:=0;
    NumPr:=0;
    skorost:=5;
    slojnost:=28;
    label3.Text:='Points: 0';
    label1.Text:='0 meters';
    kuktus:=0;
    form2.Fill.Color:=ColorMas[0];
  end;
  // ������ --------------------------------------------------------------------
  If (esc=false) and (label2.Visible=false) and (timer2.Enabled=false) and (timer4.Enabled=false)
   and (eventinfo.GestureID=sgiup) then
  begin

    timer1.Enabled:=false;
    timer2.Enabled:=true;
    j:=-Hpryjka;

    y2:= RecDinoA.Position.Y;
    y1:= RecDinoB.Position.Y;
    y0:= Image1.Position.Y;
      image1.Bitmap.Assign(image1.MultiResBitmap.Items[0].Bitmap);
  end;
  // ���������� ----------------------------------------------------------------
  If (esc=false) and (label2.Visible=false) and (timer2.Enabled=false)
   and (timer4.Enabled=false)  and (eventinfo.GestureID=sgidown) and (strt=true) then
  begin
    image1.Bitmap.Assign(image1.MultiResBitmap.Items[7].Bitmap);
    timer1.Enabled:=false;
    timer4.Enabled:=true;
    j:=-Hpryjka;
    y2:= RecDinoA.Position.Y;
    y1:= RecDinoB.Position.Y;
    y0:= Image1.Position.Y;
  end;

end;

// ������� ������ --------------------------------------------------------------
procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin

   if  (Key = 27) and (strt=false) then  exit;
  // ������ �������� -----------------------------------------------------------
  If (label2.Visible=false) and (strt=false) and (Key = 38) then
  begin
     timer1.Enabled:=true;
     strt:=true;
     timer3.Enabled:=true;
     schet:=0;
     i:=1;
     s:=0;
     cactus:=false;
     skorost:=5;
     panel3.Visible:=false;
  end;
   // ���������� ����� ----------------------------------------------------------
  If  (esc=false) and (form2.label2.Visible=false) and (Key = 27) then
  begin
    esc:=true;
    timer1.Enabled:=false;
    timer3.Enabled:=false;
    image1.Bitmap.Assign(image1.MultiResBitmap.Items[0].Bitmap);
    exit;
  end;
  // ������ ����� ----------------------------------------------------------
  If  (esc=true) and (form2.label2.Visible=false) and (Key = 27) then
  begin
    esc:=false;
    strt:=true;
    timer1.Enabled:=true;
    timer3.Enabled:=true;
  end;
  // ����� ���� ----------------------------------------------------------------
  if (form2.label2.Visible=true) and (Key = 27) then
  begin
    hig:=kuktus;

    SetObjects;

    timer1.Interval:=50;
    cactus:=false;
    label2.Visible:=false;
    ImageList[NumPr].Visible:=false;
    timer1.Enabled:=true;
    strt:=true;
    timer3.Enabled:=true;
    label1.Text:='0';
    schet:=0;
    i:=0;
    s:=0;
    k:=1;
    ii:=0;
    kuktus:=0;
    diap1:=0;
    NumPr:=0;
    skorost:=5;
    slojnost:=28;
    label3.Text:='Points: 0';
    label1.Text:='0 meters';
    kuktus:=0;
    form2.Fill.Color:=ColorMas[0];

  end;
   // ������ --------------------------------------------------------------------
  If (esc=false) and (label2.Visible=false) and (timer2.Enabled=false) and (timer4.Enabled=false) and (Key = 38) then
  begin
    image1.Bitmap.Assign(image1.MultiResBitmap.Items[0].Bitmap);
    timer1.Enabled:=false;
    timer2.Enabled:=true;
    j:=-Hpryjka;

    y2:= RecDinoA.Position.Y;
    y1:= RecDinoB.Position.Y;
    y0:= Image1.Position.Y;
  end;
     // ���������� -------------------------------------------------------------
  If (esc=false) and (label2.Visible=false) and (timer2.Enabled=false)
    and (timer4.Enabled=false)  and (Key = 40) and (strt=true) then
  begin
    image1.Bitmap.Assign(image1.MultiResBitmap.Items[7].Bitmap);
    timer1.Enabled:=false;
    timer4.Enabled:=true;
    j:=-Hpryjka;
    y2:= RecDinoA.Position.Y;
    y1:= RecDinoB.Position.Y;
    y0:= Image1.Position.Y;
  end;


end;

// �������� ������� ����� ------------------------------------------------------
procedure TForm2.FormResize(Sender: TObject);
begin
  // ����������� ---------------------------------------------------------------
  if form2.Height>form2.Width then
  begin
    label1.TextSettings.Font.Size:=form2.Width/22;
    label3.TextSettings.Font.Size:=form2.Width/22;
    label2.TextSettings.Font.Size:=form2.Width/10;
    label4.TextSettings.Font.Size:=form2.Width/23;
    label5.TextSettings.Font.Size:=form2.Width/22;

    listbox1.Width:=form2.Width*0.6;
    listbox1.Height :=form2.Height*0.38;

    Panel2.Width:=form2.Width*0.8;
    Panel2.Height :=form2.Height*0.2;

    Panel3.Width:=form2.Width*0.8;
    Panel3.Height :=form2.Height*0.4;

    ListBoxItem1.TextSettings.Font.Size:=ListBoxItem1.Width*0.13;
    ListBoxItem2.TextSettings.Font.Size:=ListBoxItem1.Width*0.13;
    ListBoxItem3.TextSettings.Font.Size:=ListBoxItem1.Width*0.13;
  end
  else // ������������� --------------------------------------------------------
  begin
    label1.TextSettings.Font.Size:=form2.Width/32;
    label3.TextSettings.Font.Size:=form2.Width/32;
    label2.TextSettings.Font.Size:=form2.Width/20;
    label4.TextSettings.Font.Size:=form2.Width/32;
    label5.TextSettings.Font.Size:=form2.Width/37;

    listbox1.Width:=form2.Width*0.39;
    listbox1.Height :=form2.Height*0.38;

    Panel2.Width:=form2.Width*0.399;
    Panel2.Height :=form2.Height*0.38;

    Panel3.Width:=form2.Width*0.395;
    Panel3.Height :=form2.Height*0.73;

    ListBoxItem1.TextSettings.Font.Size:=ListBoxItem1.Width*0.08;
    ListBoxItem2.TextSettings.Font.Size:=ListBoxItem1.Width*0.08;
    ListBoxItem3.TextSettings.Font.Size:=ListBoxItem1.Width*0.08;
  end;

  ListBoxItem1.Width:=form2.Width*0.38;
  ListBoxItem1.Height :=form2.Height*0.122;

  ListBoxItem2.Width:=form2.Width*0.38;
  ListBoxItem2.Height :=form2.Height*0.122;

  ListBoxItem3.Width:=form2.Width*0.38;
  ListBoxItem3.Height :=form2.Height*0.122;

  SetObjects;

  image6.Position.X:= form2.Width - 12*scaleX;
  image6.Position.Y:= form2.Height - 2.7*scaleY;

  image5.Position.X:= form2.Width  - 8*scaleX;
  image5.Position.Y:= form2.Height - 1.7*scaleY;

  image4.Position.X:= form2.Width  - 4*scaleX;
  image4.Position.Y:= form2.Height - 2.7*scaleY;

  image8.Position.X:= form2.Width  - 12*scaleX;
  image8.Position.Y:= form2.Height - 11*scaleY;

  image7.Position.X:= form2.Width  -  4*scaleX;
  image7.Position.Y:= form2.Height - 13*scaleY;

end;

// �������� ���� (label4) ------------------------------------------------------
procedure TForm2.Label3Click(Sender: TObject);
begin
  Panel1.Visible:=true;
end;

// ����� �� ��������� ----------------------------------------------------------
procedure TForm2.ListBoxItem1Click(Sender: TObject);
begin
  panel3.Visible:=true;
end;

// � �������� ------------------------------------------------------------------
procedure TForm2.ListBoxItem2Click(Sender: TObject);
begin
  panel2.Visible:=true;
end;

// �������� ��������� ----------------------------------------------------------
procedure TForm2.ListBoxItem3Click(Sender: TObject);
begin
  application.Terminate;
end;

// �������� ���� ---------------------------------------------------------------
procedure TForm2.Panel1Click(Sender: TObject);
begin
  if panel1.Visible=true then panel1.Visible:=false;
end;

//�������� � ��������� ----------------------------------------------------------
procedure TForm2.Button1Click(Sender: TObject);
begin
  panel2.Visible:=false;
end;

//�������� ���������� ----------------------------------------------------------
procedure TForm2.Button2Click(Sender: TObject);
begin
  panel3.Visible:=false;
end;

// ��������� ������ ------------------------------------------------------------
procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if i=6 then i:=0;
  image1.Bitmap.Assign(image1.MultiResBitmap.Items[i].Bitmap);
  i:=i+1;

end;

// ������ ---------------------------------------------------------------------
procedure TForm2.Timer2Timer(Sender: TObject);
begin

  xOtj:=-j*j/1.5+Hpryjka*Hpryjka/1.5;
  Image1.Position.Y:=y0 - xOtj;
  RecDinoA.Position.Y:=y2 - xOtj;
  RecDinoB.Position.Y:=y1 - xOtj;
  j:=j + 1;
  if j = Hpryjka+1 then
  begin
    timer2.Enabled:=false;
    timer1.Enabled:=true;
  end;
end;

// ���������� ------------------------------------------------------------------
procedure TForm2.Timer4Timer(Sender: TObject);
begin
  Image1.Position.Y:=y0 +20;
  RecDinoA.Position.Y:=y2;
  RecDinoB.Position.Y:=y1  +30;
  j:=j + 1;
  if j = Hpryjka+1 then
  begin
    timer4.Enabled:=false;
    timer1.Enabled:=true;
    Image1.Position.Y:=y0;
    RecDinoA.Position.Y:=y2;
    RecDinoB.Position.Y:=y1;
  end;
end;

// �������� ����� ���� --------------------------------------------------------
procedure TForm2.Timer3Timer(Sender: TObject);
var
  varX, varY, promVarY, promVarY1, promVarY2: single;
begin
  ImageList[NumPr].Visible :=true;
  ImageList[NumPr].Position.X := ImageList[NumPr].Position.X - skorost;
  RecList1[NumPr].Position.X  :=  RecList1[NumPr].Position.X - skorost;
  RecList2[NumPr].Position.X  :=  RecList2[NumPr].Position.X - skorost;

  form2.image4.Position.X := form2.image4.Position.X - skorost;
  form2.image5.Position.X := form2.image5.Position.X - skorost;
  form2.image6.Position.X := form2.image6.Position.X - skorost;
  form2.image7.Position.X := form2.image7.Position.X - (skorost - 1);
  form2.image8.Position.X := form2.image8.Position.X - (skorost - 2);

  // ������������� ����������� --------------------------------------------------
  if ImageList[NumPr].Position.X<0 then
  begin
    ImageList[NumPr].Position.X := ImageList[NumPr].Position.X + form2.Width;
    RecList1[NumPr].Position.X  := RecList1[NumPr].Position.X  + form2.Width;
    RecList2[NumPr].Position.X  := RecList2[NumPr].Position.X  + form2.Width;
    ImageList[NumPr].Visible := false;

    randomize;
    case s of
      1  : diap1:=1;
      2 :  diap1:=2;
      3 :  diap1:=4;
      4 :  diap1:=4;
    end;

   NumPr := Random(diap1);
   // ������� ��������� ����� ---------------------------------------------------
   if NumPr=3 then
   begin

     diap:=trunc(image2.Position.Y+image2.Height/2-1.5*ImageList[3].Height);
     randomize;
     varY:=random(diap);

     ImageList[NumPr].Position.Y := Y31pt + varY;
     RecList1[NumPr].Position.Y  := Y32pt + varY;
     RecList2[NumPr].Position.Y  := Y32pt  + varY;

   end;

    varX := random(trunc(form2.Width/2));

    ImageList[NumPr].Visible := true;
    ImageList[NumPr].Position.X := ImageList[NumPr].Position.X + varX;
    RecList1[NumPr].Position.X  :=  RecList1[NumPr].Position.X + varX;
    RecList2[NumPr].Position.X  :=  RecList2[NumPr].Position.X + varX;

    //RecList1[NumPr].Visible:=true;
    ///RecList2[NumPr].Visible:=true;

    cactus:=false;
  end;

  if form2.image4.Position.X<0 then  form2.image4.Position.X:=form2.Width;
  if form2.image5.Position.X<0 then  form2.image5.Position.X:=form2.Width;
  if form2.image6.Position.X<0 then  form2.image6.Position.X:=form2.Width;
  if form2.image7.Position.X<0 then  form2.image7.Position.X:=form2.Width;
  if form2.image8.Position.X<0 then  form2.image8.Position.X:=form2.Width;


   // ������� ���������� -------------------------------------------------------
  cts:=cts+1;
  if cts=10 then
  begin
    kuktus:=kuktus+1;
    form2.label1.Text:=floattostr(kuktus)+' meters';
    cts:=0;
  end;
  // ���������� ������� � ���� �������� ----------------------------------------
  if ( ImageList[NumPr].Position.X <=  Image1.Position.X/2)  and (cactus=false) then
  begin
    schet:=schet+1;
    form2.label3.Text:='Points: '+FloatToStr(schet);
    cactus:=true;

    // �������� ----------------------------------------------------------------
    k:=k+1;
    if k=6 then
    begin
      skorost:=skorost+2;
      if timer1.Interval<slojnost then
      begin
        skorost:=5;
        diap1:=0;
        ii:=ii+1;
        form2.Fill.Color:=ColorMas[ii];
        slojnost:=slojnost-2;
        if ii=6 then ii:=0;
        timer1.Interval:=50;
        s:=0;
      end
      else
      begin
        timer1.Interval:=timer1.Interval-3;

      end;
      k:=1;
      s:=s+1;
    end;
    if s>4 then  s:=4;

  end;

  // ���������� ����������� ----------------------------------------------------
  if (IntersectRect(  RecList1[NumPr].BoundsRect,  RecDinoA.BoundsRect)) or
     (IntersectRect(  RecList1[NumPr].BoundsRect,  RecDinoB.BoundsRect)) or
     (IntersectRect(  RecList2[NumPr].BoundsRect,  RecDinoA.BoundsRect)) or
     (IntersectRect(  RecList2[NumPr].BoundsRect,  RecDinoB.BoundsRect))
  then
  begin
    if timer4.Enabled=true then
    begin
      image1.Position.Y:=y0;
      RecDinoA.Position.Y:=y2;
      RecDinoB.Position.Y:=y1;
     end;
    form2.timer1.Enabled:=false;
    form2.timer2.Enabled:=false;
    form2.timer4.Enabled:=false;


    timer3.Enabled:=false;
    form2.image1.Bitmap.Assign(form2.image1.MultiResBitmap.Items[6].Bitmap);
    form2.label2.Visible:=true;
    form2.label4.Visible:=true;

    if hig<kuktus then
    begin
      hig:= kuktus;
      form2.label4.Text:='Hi: '+floattostr(hig);
    end;
  end;

end;

end.
