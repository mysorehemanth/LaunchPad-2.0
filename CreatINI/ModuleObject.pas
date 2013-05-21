unit ModuleObject;

interface

uses
SysUtils,Dialogs,Classes,inifiles;


type TModule = class
private
   { Private declarations }

   TSectionID: String;
   TLanType: String;
   TModuleType: String;
   TModuleName: String;
   TFirmwareDir: String;
   TProgrammer: integer;
   TScriptDir: String;
   TPicDir: String;
   TLocker: integer;

   Function GetSectionID:String;
   Function GetLanType:String;
   Function GetModuleType:String;
   Function GetModuleName:String;
   Function GetFirmwareDir:String;
   Function GetProgrammer:integer;
   Function GetScriptDir:String;
   Function GetPicDir:String;
   Function GetLocker:integer;
   Procedure SetSectionID(Value:String);
   Procedure SetLanType(Value:String);
   Procedure SetModuleType(Value:String);
   Procedure SetModuleName(Value:String);
   Procedure SetFirmwareDir(Value:String);
   Procedure SetProgrammer(Value:integer);
   Procedure SetScriptDir(Value:String);
   Procedure SetPicDir(Value:String);
   Procedure SetLocker(Value:integer);
   //procedure Execute(FileName, Parameter: string);

public
    { Public declarations }
    //Constructor Create; overload;   // This constructor uses defaults
    Constructor Create(SectionID : string); overload;
    Constructor Create(IniFileName: String; SectionID : string); overload;
    property SectionID:String read GetSectionID write SetSectionID;
    property LanType:String read GetLanType write SetLanType;
    property ModuleType:String read GetModuleType write SetModuleType;
    property ModuleName:String read GetModuleName write SetModuleName;
    property FirmwareDir:String read GetFirmwareDir write SetFirmwareDir;
    property Programmer:integer read GetProgrammer write SetProgrammer;
    property ScriptDir:String read GetScriptDir write SetScriptDir;
    property PicDir:String read GetPicDir write SetPicDir;
    property Locker:integer read GetLocker write SetLocker;
    
    Procedure ProgramModule;
    Procedure WriteINI(IniFile:TIniFile);
    Procedure ReadINI(IniFile:TIniFile;SectionID:String);

end;
const
  DEFAULT_INI_FILE_NAME = '\LaunchPad.ini';
  LOCKED = 1;
  UNLOCK = -1;
  UNUSED = 0;
  DIGIFLEX_FLASH_PROGRAMMER ='';
  NEC_PROGRAMMER = '';
  ICD3_PROGRAMMER = '';
  RENESAS_PROGRAMMER = '';
  DIGIFLEX = 1;
  NEC = 2;
  ICD3 = 3;
  RENESAS = 4;

var
FModule: TModule;
IniFile:TIniFile;


implementation

//**********************************************************************
//
//  Constructor:
//
//  PARAMETERS:
//
//**********************************************************************
Constructor TModule.Create(SectionID:String);
begin
     self.TSectionID := SectionID;

end;

//**********************************************************************
//
//  Constructor:
//
//  PARAMETERS:
//
//**********************************************************************
Constructor TModule.Create(IniFileName: String; SectionID : string);
begin
     IniFile := TIniFile.Create(IniFileName);
     ReadINI(IniFile,SectionID);

end;

//**********************************************************************
//
//  Function: GetSectionID
//
//  PARAMETERS: NUN
//
//  RESULT:
//
//**********************************************************************
Function TModule.GetSectionID:String;
begin
Result := self.TSectionID;
end;

//**********************************************************************
//
//  Function: GetLanType
//
//  PARAMETERS: NUN
//
//  RESULT:
//
//**********************************************************************
Function TModule.GetLanType:String;
begin
Result := self.TLanType;
end;

//**********************************************************************
//
//  Function: GetModuleType
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TModule.GetModuleType:String;
begin
Result := self.TModuleType;
end;

//**********************************************************************
//
//  Function: GetModuleName
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TModule.GetModuleName:String;
begin
Result := self.TModuleName;
end;

//**********************************************************************
//
//  Function: GetFirmwareDir
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TModule.GetFirmwareDir:String;
begin
Result := self.TFirmwareDir;
end;

//**********************************************************************
//
//  Function: GetProgrammer
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TMOdule.GetProgrammer:integer;
begin
Result := self.TProgrammer;
end;

//**********************************************************************
//
//  Function: GetScriptDir
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TMOdule.GetScriptDir:String;
begin
Result := self.TScriptDir;
end;

//**********************************************************************
//
//  Function: GetPicDir
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TModule.GetPicDir:String;
begin
Result := self.TPicDir;
end;

//**********************************************************************
//
//  Function: GetLocker
//
//  PARAMETERS: NUN
//  
//  RESULT:
//
//**********************************************************************
Function TModule.GetLocker:integer;
begin
Result := self.TLocker;
end;

//**********************************************************************
//
//  Function: SetSectionID
//
//  PARAMETERS:  Value: String;
//
//  RESULT:
//
//**********************************************************************
Procedure TModule.SetSectionID(Value:String);
begin
self.TSectionID := value;
end;

//**********************************************************************
//
//  PROCEDURE: SetLanType
//
//  PARAMETERS: Value: String
//
//**********************************************************************
Procedure TModule.SetLanType(Value:String);
begin
self.TLanType := value;
end;

//**********************************************************************
//
//  PROCEDURE: SetModuleType
//
//  PARAMETERS: Value: String
//
//**********************************************************************
Procedure TModule.SetModuleType(Value:String);
begin
FModule.TModuleType := value;
end;

//**********************************************************************
//
//  PROCEDURE: SetModuleName
//
//  PARAMETERS: Value: String
//
//**********************************************************************
Procedure TModule.SetModuleName(Value:String);
begin
self.TModuleName := value;
end;

//**********************************************************************
//
//  PROCEDURE: SetFirmwareDir
//
//  PARAMETERS: Value: String
//
//**********************************************************************
Procedure TModule.SetFirmwareDir(Value:String);
begin
self.TFirmwareDir := value;
end;

//**********************************************************************
//
//  PROCEDURE: SetProgrammer
//
//  PARAMETERS: Value: integer
//
//**********************************************************************
Procedure TModule.SetProgrammer(Value:integer);
begin
self.TProgrammer := value;
end;

//**********************************************************************
//
//  PROCEDURE:  SetScriptDir
//
//  PARAMETERS: Value: String
//
//**********************************************************************
Procedure TModule.SetScriptDir(Value:String);
begin
self.TScriptDir := value;
end;

//**********************************************************************
//
//  PROCEDURE:   SetPicDir
//
//  PARAMETERS:  Value: String
//
//**********************************************************************
Procedure TModule.SetPicDir(Value:String);
begin
self.TPicDir := value;
end;

//**********************************************************************
//
//  PROCEDURE:  SetLocker
//
//  PARAMETERS: Value: integer
//
//**********************************************************************
Procedure TModule.SetLocker(Value:integer);
begin
self.TLocker := value;
end;



//**********************************************************************
//
//  PROCEDURE:    ProgramModule - Not working Yet.
//
//  PARAMETERS:   Nil
//
//**********************************************************************
Procedure TModule.ProgramModule;
//var
   //ParameterString,CommandString: String;
begin
ShowMessage(SectionID+'Module Object Programmer Launch is coming soon...');

end;

//**********************************************************************
//
//  PROCEDURE:    WriteINI - Write all of Module Object's properties into
//                the ini file Object.
//
//  PARAMETERS:   -TInifile
//
//**********************************************************************
Procedure TModule.WriteINI(IniFile:TIniFile);
var
   SectionID:String;
begin
    SectionID := self.TSectionID;
    IniFile.WriteString(SectionID,'ModuleName',self.TModuleName);
    IniFile.WriteString(SectionID,'FirmwareDir',self.TFirmwareDir);
    IniFile.WriteInteger(SectionID,'Programmer',self.TProgrammer);
    IniFile.WriteString(SectionID,'ScriptDir',self.TScriptDir);
    IniFile.WriteString(SectionID,'ModulePicDir',self.TPicDir);
    IniFile.WriteInteger(SectionID,'Locker',self.TLocker);


end;

//**********************************************************************
//
//  PROCEDURE:    ReadINI - Read all of Module's properties from ini file
//                into module Object based on the Section ID.
//
//  PARAMETERS:   -TInifile
//                -SectionID
//
//**********************************************************************
Procedure TModule.ReadINI(IniFile:TIniFile;SectionID:String);
begin
     self.TSectionID := SectionID;
     self.TLanType   := IntToStr(StrToInt(SectionID) div 1000);
     Self.TModuleType:= IntToStr((StrToInt(SectionID) div 100) mod 10);
     Self.TModuleName:= IniFile.ReadString(SectionID,'ModuleName','Nothing read');
     Self.TFirmwareDir := IniFile.ReadString(SectionID,'FirmwareDir','Nothing read');
     self.TProgrammer := IniFile.ReadInteger(SectionID,'Programmer',0);
     self.TScriptDir := IniFile.ReadString(SectionID,'ScriptDir','Nothing read');
     self.TPicDir := IniFile.ReadString(SectionID,'ModulePicDir','Nothing read');
     self.TLocker :=IniFile.ReadInteger(SectionID,'Locker',0);
end;


end.
