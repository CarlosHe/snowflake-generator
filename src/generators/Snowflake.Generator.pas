unit Snowflake.Generator;

interface

uses
  Snowflake.Contract.Generator;

type

  TSnowflakeGenerator = class(TInterfacedObject, ISnowflakeGenerator)
  strict private
    { strict private declarations }
    constructor Create(const AEpochOffset: Int64; const ATimestampBits, AMachineBits, ASequenceBits: Integer);
  private
    { private declarations }
    FEpochOffset: Int64;
    FTimestampBits: Integer;
    FMachineBits: Integer;
    FSequenceBits: Integer;
    FMaxSequence: Int64;
    FLastTimestamp: Int64;
    FSequence: Int64;
  protected
    { protected declarations }
    function GetTimestamp: Int64;
    function WaitNextTimestamp(const ALastTimestamp: Int64): Int64;
  public
    { public declarations }
    function GenerateID(const AMachineID: UInt64): UInt64;
    class function New(const AEpochOffset: Int64; const ATimestampBits, AMachineBits, ASequenceBits: Integer): ISnowflakeGenerator;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

{ TSnowflakeGenerator }

constructor TSnowflakeGenerator.Create(const AEpochOffset: Int64; const ATimestampBits, AMachineBits, ASequenceBits: Integer);
begin
  FEpochOffset := AEpochOffset;
  FTimestampBits := ATimestampBits;
  FMachineBits := AMachineBits;
  FSequenceBits := ASequenceBits;
  FMaxSequence := (1 shl FSequenceBits) - 1;
end;

function TSnowflakeGenerator.GenerateID(const AMachineID: UInt64): UInt64;
var
  LCurrentTimestamp: Int64;
begin
  LCurrentTimestamp := GetTimestamp;
  if LCurrentTimestamp = FLastTimestamp then
  begin
    FSequence := (FSequence + 1) and FMaxSequence;
    if FSequence = 0 then
      LCurrentTimestamp := WaitNextTimestamp(FLastTimestamp);
  end
  else
    FSequence := 0;
  FLastTimestamp := LCurrentTimestamp;
  Result := (LCurrentTimestamp shl (FMachineBits + FSequenceBits)) or (AMachineID shl FSequenceBits) or FSequence;
end;

function TSnowflakeGenerator.GetTimestamp: Int64;
begin
  Result := (DateTimeToUnix(Now) * 1000) - FEpochOffset;
end;

class function TSnowflakeGenerator.New(const AEpochOffset: Int64; const ATimestampBits, AMachineBits, ASequenceBits: Integer): ISnowflakeGenerator;
begin
  Result := Self.Create(AEpochOffset, ATimestampBits, AMachineBits, ASequenceBits);
end;

function TSnowflakeGenerator.WaitNextTimestamp(const ALastTimestamp: Int64): Int64;
var
  LTimestamp: Int64;
begin
  LTimestamp := GetTimestamp;
  while LTimestamp <= ALastTimestamp do
    LTimestamp := GetTimestamp;
  Result := LTimestamp;
end;

end.
