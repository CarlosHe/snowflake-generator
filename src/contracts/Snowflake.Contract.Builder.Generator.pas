unit Snowflake.Contract.Builder.Generator;

interface

uses
  Snowflake.Contract.Generator;

type

  ISnowflakeGeneratorBuilder = interface
    ['{D7B200AB-F81B-4FBB-9535-2E1C95C6DFCB}']
    function WithEpochOffset(const AEpochOffset: Int64): ISnowflakeGeneratorBuilder;
    function WithTimestampBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
    function WithMachineBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
    function WithSequenceBits(const ABits: Integer): ISnowflakeGeneratorBuilder;
    function Build: ISnowflakeGenerator;
  end;

implementation

end.
