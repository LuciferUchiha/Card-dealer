defmodule DealerTest do
  use ExUnit.Case
  doctest Dealer

  test "create_deck makes 52 cards" do
    deck_length = length(Dealer.create_deck)
    assert deck_length == 52
  end

  test "shuffle changes order" do
    # To 99.9% will pass
    deck = Dealer.create_deck
    refute deck == Dealer.shuffle(deck)
  end
end
