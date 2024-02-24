# SimpleKVS

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_kvs` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_kvs, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/simple_kvs](https://hexdocs.pm/simple_kvs).

```elixir
iex(1)> SimpleKVS.start_link
{:ok, #PID<0.181.0>}
iex(2)> SimpleKVS.keys      
[]
iex(3)> SimpleKVS.store(:a, 1)
:ok
iex(4)> SimpleKVS.keys        
[:a]
iex(5)> SimpleKVS.lookup(:a)
1
```

初期値を入れてみる
```elixir
iex(1)> SimpleKVS.start_link(%{a: 1})
{:ok, #PID<0.149.0>}
iex(2)> SimpleKVS.keys
[:a]
iex(3)> SimpleKVS.store(:b, 2)
:ok
iex(4)> SimpleKVS.keys        
[:a, :b]
iex(5)> SimpleKVS.lookup(:a)  
1
```
