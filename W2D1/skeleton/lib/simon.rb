class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
    @answer_seq = []
  end

  def play
    puts "\nWelcome to Simon!"
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
    @answer_seq = []
  end

  def clear_display
    system("clear")
  end

  def show_sequence
    sleep(2)
    add_random_color
    @seq.each do |color|
      clear_display
      puts "\nWatch the color sequence closely!\n\n"
      sleep(1)
      puts color.capitalize
      sleep(1)
    end
  end

  def require_sequence
    until @answer_seq.length == @seq.length
      clear_display
      puts "\nPlease input the next color! (e.g. \"Red\", \"Blue\", \"Green\", or \"Yellow\")\n\n"
      color_selection = gets.chomp.downcase
      unless COLORS.include?(color_selection)
        raise RuntimeError.new("Invalid input")
      end
      check_answer(color_selection)
    end
  rescue
    clear_display
    puts "\nSorry, but that input was not valid!"
    sleep(2)
    retry
  end

  def check_answer(answer)
    @answer_seq << answer
    current = @answer_seq.length - 1
    if @answer_seq[current] != @seq[current]
      @game_over = true
      @answer_seq = @seq
    end
  end

  def add_random_color
    color = COLORS.sample
    @seq << color
  end

  def round_success_message
    clear_display
    puts "\nGreat job! Next Round!"
  end

  def game_over_message
    clear_display
    puts "\nGAME OVER, man, GAME OVER!\n\n"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
