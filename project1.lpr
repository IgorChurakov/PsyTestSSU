program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, editor, admin, user, test, main
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAdminWindow, AdminWindow);
  Application.CreateForm(TEditorWindow, EditorWindow);
  Application.CreateForm(TUserWindow, UserWindow);
  Application.CreateForm(TTestWindow, TestWindow);
  Application.Run;
end.
