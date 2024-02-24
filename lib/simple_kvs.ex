defmodule SimpleKVS do
  @moduledoc """
  Documentation for `SimpleKVS`.
  """

  use GenServer

  # コールバック関数
  def init(state) when is_map(state), do: {:ok, state}
  def init(_state), do: {:ok, %{}}

  def handle_call(:keys, _from, state), do: {:reply, Map.keys(state), state}

  def handle_call({:lookup, key}, _from, state) do
    {:reply, state[key], state}
  end

  def handle_cast({:store, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # API兼コールバック
  @doc """
  start SimpleKVS if not started.
  """
  def start_link(state \\ %{}) do
    GenServer.start_link(__MODULE__, state, name: :kvs)
  end

  # API
  @doc """
  get keys
  """
  def keys, do: GenServer.call(:kvs, :keys)

  @doc """
  look up for key
  """
  def lookup(key), do: GenServer.call(:kvs, {:lookup, key})

  @doc """
  store key/value
  """
  def store(key, value), do: GenServer.cast(:kvs, {:store, key, value})
end
