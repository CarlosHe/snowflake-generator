unit Snowflake;

interface

uses

  Snowflake.Contract.Generator,
  Snowflake.Contract.Builder.Generator,
  Snowflake.Generator,
  Snowflake.Builder.Generator;

type

  ISnowflakeGenerator = Snowflake.Contract.Generator.ISnowflakeGenerator;
  ISnowflakeGeneratorBuilder = Snowflake.Contract.Builder.Generator.ISnowflakeGeneratorBuilder;
  TSnowflakeGenerator = Snowflake.Generator.TSnowflakeGenerator;
  TSnowflakeGeneratorBuilder = Snowflake.Builder.Generator.TSnowflakeGeneratorBuilder;

implementation

end.
