# One important thing to note is that it is generally impractical to test console user input, so the specs don't test require_sequence. The goal of require_sequence is to prompt the user to repeat back the new sequence that was just shown to them, one color at a time. If they give an incorrect color, it should immediately set @game_over to be false.

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize

  end

  def play

  end

  def take_turn

  end

  def show_sequence

  end

  def require_sequence

  end

  def add_random_color

  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game

  end
end
