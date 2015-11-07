ExUnit.start

defmodule ShoppingTest do
  use ExUnit.Case

  test "checking shopping functions" do
    assert 'jumble' == 'jumble'
    refute 'jumble' == "jumble"
    assert 'jumble' == "jumble" |> to_char_list
    assert 'jumble' |> Enum.sort == 'bejlmu'
  end

  test "Shopping" do
    assert Shopping.add([{:add, "orange"},{:add, "bananas"},{:add, "donut"}], "grapes") == [{:add, "grapes"},{:add, "orange"},{:add, "bananas"},{:add, "donut"}]
    assert Shopping.remove([{:add, "orange"},{:add, "bananas"},{:add, "donut"}], "donut") == [{:remove, "donut"},{:add, "orange"},{:add, "bananas"},{:add, "donut"}]
  end
end
defmodule Shopping do
  def add(basket,item), do: [{:add, item} | basket]

  def remove(basket, item) do
    cond do
      Enum.member? basket, {:add, item} ->
        [{:remove, item} | basket]
      true ->
        basket
    end
  end
  def countitems(basket) do
    Enum.count(basket) -  2 * (Enum.filter(basket, fn {x, _} -> x==:remove end) |> Enum.count)
  end

#    def remove(basket, item) when basket == '' or item == '' do
#      basket
#    end
end
