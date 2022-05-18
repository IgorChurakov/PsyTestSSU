unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    ButtonAdmin: TButton;
    ButtonBackUser: TButton;
    ButtonBackAdmin: TButton;
    ButtonNextAdmin: TButton;
    ButtonUser: TButton;
    ButtonNextUser: TButton;
    EditGroup: TEdit;
    EditFamily: TEdit;
    EditFirstName: TEdit;
    EditPassword: TEdit;
    EditLastName: TEdit;
    LabelAuthorizationUser: TLabel;
    LabelAuthorizationAdmin: TLabel;
    LabelFamily: TLabel;
    LabelFirstName: TLabel;
    LabelPassword: TLabel;
    LabelLastName: TLabel;
    LabelGroup: TLabel;
    PanelAuthorizationAdmin: TPanel;
    PanelMain: TPanel;
    PanelAuthorizationUser: TPanel;
    procedure ButtonAdminClick(Sender: TObject);
    procedure ButtonBackAdminClick(Sender: TObject);
    procedure ButtonBackUserClick(Sender: TObject);
    procedure ButtonNextAdminClick(Sender: TObject);
    procedure ButtonNextUserClick(Sender: TObject);
    procedure ButtonUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

Type StudentClass=class
  group: string;
  familyName: string;
  firstName: string;
  lastName: string;
end;

var
  MainForm: TMainForm;
  currentStudent: StudentClass;

implementation
  uses user, admin;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  PanelMain.Top:=200;
  PanelMain.Left:=300;
  PanelAuthorizationUser.Top:=200;
  PanelAuthorizationUser.Left:=300;
  PanelAuthorizationAdmin.Top:=200;
  PanelAuthorizationAdmin.Left:=300;
end;

procedure TMainForm.ButtonUserClick(Sender: TObject);
begin
  PanelMain.Visible:=false;
  PanelAuthorizationUser.Visible:=true;
end;

procedure TMainForm.ButtonBackUserClick(Sender: TObject);
begin
  PanelMain.Visible:=true;
  PanelAuthorizationUser.Visible:=false;
  EditGroup.Clear;
  EditFamily.Clear;
  EditFirstName.Clear;
  EditLastName.Clear;
end;

procedure TMainForm.ButtonNextAdminClick(Sender: TObject);
begin

end;

procedure TMainForm.ButtonAdminClick(Sender: TObject);
begin
  PanelMain.Visible:=false;
  PanelAuthorizationAdmin.Visible:=true;
end;

procedure TMainForm.ButtonBackAdminClick(Sender: TObject);
begin
  PanelMain.Visible:=true;
  PanelAuthorizationAdmin.Visible:=false;
  EditPassword.Clear;
end;

procedure TMainForm.ButtonNextUserClick(Sender: TObject);
begin
  if (EditGroup.Text = '') then
     ShowMessage('Введите группу')
  else
    if (EditFamily.Text = '') then
       ShowMessage('Введите фамилию')
    else
      if (EditFirstName.Text = '') then
         ShowMessage('Введите имя')
      else
        if (EditLastName.Text = '') then
           ShowMessage('Введите отчество')
        else
          begin
            currentStudent:=StudentClass.Create;
            currentStudent.group:=EditGroup.Text;
            currentStudent.familyName:=EditFamily.Text;
            currentStudent.firstName:=EditFirstName.Text;
            currentStudent.lastName:=EditLastName.Text;
            MainForm.Visible:=false;
            user.UserWindow.ShowModal;
          end;
end;

end.

