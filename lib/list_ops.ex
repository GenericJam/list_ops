defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]) do
    0
  end

  def count([_h | t]) do
    count(t) + 1
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  def reverse([], rev) do
    rev
  end

  def reverse([h | t], rev) do
    reverse(t, [h | rev])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _f) do
    []
  end

  def map([h | t], f) do
    [apply(f, [h]) | map(t, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f) do
    []
  end

  def filter([h | _t] = l, f) do
    filter_result(apply(f, [h]), l, f)
  end

  def filter_result(true, [h | t], f) do
    [h | filter(t, f)]
  end

  def filter_result(false, [_h | t], f) do
    filter(t, f)
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f) do
    acc
  end

  def reduce([h | t], acc, f) do
    reduce(t, apply(f, [h, acc]), f)
  end

  @spec append(list, list) :: list
  def append([], b) do
    b
  end

  def append([h | t], b) do
    [h | append(t, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat([[t]]) do
    [t]
  end

  def concat([[] | rest]) do
    concat(rest)
  end

  def concat([[h | t] | rest]) do
    [h | concat([t | rest])]
  end
end
