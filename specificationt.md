# Data

{"foo": [1, null], "baz": {"foo": [true, "bar"], "baz": "qux"}}

# Molding

{
  "foo": [1, null],
  "baz":
  {
    "foo": [true, "bar"],
    "baz": "qux"
  }
}

# Hash

{"foo"=>[1, nil], "baz"=>{"foo"=>[true, "bar"], "baz"=>"qux"}}

# json2csharp

public class Baz
{
    public List<object> foo { get; set; }
    public string baz { get; set; }
}

public class RootObject
{
    public List<int?> foo { get; set; }
    public Baz baz { get; set; }
}

# 仕様

## クラスについて

- rootは、RootObject 固定とする。
- 入れ子 {} があったら、クラスとする。（hash in hash を探す。）

## メンバについて

- 全てインスタンス変数とする。
- keyを変数名にする。

## データについて

- データは無視（rubyに型はないため）
