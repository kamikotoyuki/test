unit Unit1;

{$mode objfpc}{$H+}

interface

uses
SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;
  type
// базовый класс
   { TPerson }
TPerson = class
fName: string; // имя
constructor Create(name:string);
function info:string; virtual;
end;
// класс Студент
   { TStudent }
TStud = class (TPerson)
fGr:integer; // номер группы
constructor Create(name:string;gr:integer);
function info:string;
override;
end;
// класс Преподаватель
   { TProf }
TProf = class (TPerson)
fdep:string; // название кафедры
constructor Create(name:string;dep:string);
function info:string;
override;
end;
const
SZL = 10; // размер списка
var
Forml: TForm1;
List: array[1..SZL] of TPerson; // список
n:integer =0; // кол-во людей в списке

implementation

{$R *.lfm}

{ TProf }

constructor TProf.Create(name: string; dep: string);
begin
  inherited create(name); // вызвать конструктор базового класса
fDep := dep;
end;

function TProf.info: string;
begin
  Result:=inherited info;
end;

{ TStud }

constructor TStud.Create(name: string; gr: integer);
begin
  inherited create(name); // вызвать конструктор базового класса
fGr := gr;
end;

function TStud.info: string;
begin
  Result:=inherited info;
end;

{ TPerson }

constructor TPerson.Create(name: string);
begin
   fName := name;
end;

function TPerson.info: string;
begin
  result := fname;
end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
if n < SZL then begin
// добавить объект в список
n:=n+1;
if Radiobutton1.Checked
then // создадим объект TStud
List[n]:=TStud.Create(Edit1.Text,StrToInt(Edit2 .Text))
else // создать объект TProf
List[n]:=TProf.Create(Edit1.Text,Edit2.Text);
Edit1.Text := ' ' ; Edit2.Text := ' ';
Edit1.SetFocus; // курсор в поле Фамилия
end
else ShowMessage('Список заполнен!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
i:integer; // индекс
st:string; // список
begin
for i:=1 to SZL do
if list [i] <> NIL then st:=st+list[i].info+#13;
ShowMessage('Список'+#13+st);
end;

end.

