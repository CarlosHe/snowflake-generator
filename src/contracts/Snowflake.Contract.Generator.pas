unit Snowflake.Contract.Generator;

interface

type

  ISnowflakeGenerator = interface
    ['{42B161A3-F0E6-4132-A2A7-3E6A7D512317}']
    function GenerateID(const AMachineID: UInt64): UInt64;
  end;

implementation

end.
