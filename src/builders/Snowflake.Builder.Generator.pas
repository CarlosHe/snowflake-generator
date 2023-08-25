unit Snowflake.Builder.Generator;

interface

uses
  Snowflake.Contract.Builder.Generator,
  Snowflake.Contract.Generator;

type

  TSnowflakeGeneratorBuilder = class(TInterfacedObject, ISnowflakeGeneratorBuilder)
  strict private
    { strict private declarations }
    constructor Create;
  private
    { private declarations }
    FEpochOffset: Int64;
    FTimestampBits: Integer;
    FMachineBits: Integer;
    FSequenceBits: Integer;
  protected
    { protected declarations }
  public
    { public declarations }
    function WithEpochOffset(const AEpochOffset: Int64): ISnowflakeGeneratorBuilder;
    function WithTimestampBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
    function WithMachineBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
    function WithSequenceBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
    function Build: ISnowflakeGenerator;
    class function New: ISnowflakeGeneratorBuilder;
  end;

implementation

uses
  Snowflake.Generator;

{ TSnowflakeGeneratorBuilder }

function TSnowflakeGeneratorBuilder.Build: ISnowflakeGenerator;
begin
  Result := TSnowflakeGenerator.New(FEpochOffset, FTimestampBits, FMachineBits, FSequenceBits);
end;

constructor TSnowflakeGeneratorBuilder.Create;
begin
  FEpochOffset := 1420070400000;
  FTimestampBits := 41;
  FMachineBits := 10;
  FSequenceBits := 12;
end;

class function TSnowflakeGeneratorBuilder.New: ISnowflakeGeneratorBuilder;
begin
  Result := Self.Create;
end;

function TSnowflakeGeneratorBuilder.WithEpochOffset(const AEpochOffset: Int64): ISnowflakeGeneratorBuilder;
begin
  Result := Self;
  FEpochOffset := AEpochOffset;
end;

function TSnowflakeGeneratorBuilder.WithMachineBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
begin
  Result := Self;
  FMachineBits := ABits;
end;

function TSnowflakeGeneratorBuilder.WithSequenceBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
begin
  Result := Self;
  FSequenceBits := ABits;
end;

function TSnowflakeGeneratorBuilder.WithTimestampBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
begin
  Result := Self;
  FTimestampBits := ABits;
end;

end.
