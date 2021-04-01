defmodule Dealer do
  @moduledoc """
    Provides functions for creating and handling a deck of cards.
  """
  @doc """
  Return a list representing a deck of cards.
  """
  def create_deck do
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  `hand_size` indicates how many cards should be in the hand.
  ## Examples
      iex> deck = Dealer.create_deck
      iex> {hand, _rest} = Dealer.deal_hand(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal_hand(deck, hand_size) do
    # Return a Tuple with the first element being the hand the second the rest of the deck
    Enum.split(deck, hand_size)
  end

  @doc """
  Changes the order of the cards in the deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Creates a new deck, shuffles the deck and then divides the deck into a hand and the remainder of the deck.
  """
  def create_hand(hand_size) do
    # optional parentheses, also if passing multiple arguments, except when using a pipe call with arguments
    Dealer.create_deck
    |> Dealer.shuffle
    |> Dealer.deal_hand(hand_size)
  end

  @doc """
  Return whether the `deck` contains the `card`.
  ## Examples
      iex> Dealer.contains?(["Ace", "Queen"], "Queen")
      true
      iex> Dealer.contains?(["Ace", "Queen"], "King")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Saves the `deck` into a file with the name `file_name`.
  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  @doc """
  Loads a deck of cards from the file with the name matching `file_name`.
  ## Examples
      iex> deck = ["Ace", "Queen"]
      iex> Dealer.save(deck, "my_deck")
      iex> Dealer.load("my_deck")
      ["Ace", "Queen"]
      iex> Dealer.load("not_my_deck")
      "There was a problem with loading the file."
  """
  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "There was a problem with loading the file."
    end
  end

end
