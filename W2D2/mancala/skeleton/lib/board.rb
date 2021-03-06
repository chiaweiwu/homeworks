class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,idx|
      if idx != 6 && idx != 13
        4.times do
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos <= 0 || start_pos >= 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

    stones_num = @cups[start_pos]
    @cups[start_pos] = []

    cup = start_pos

    until stones_num.empty?
      cup += 1
      cup = 0 if cup > 13
      # don't place stones into the other player's cup
      if cup == 6
        @cups[6] << stones_num.pop if current_player_name == @name1
      elsif cup == 13
        @cups[13] << stones_num.pop if current_player_name == @name2
      else
        @cups[cup] << stones_num.pop
      end

    end

    render
    next_turn(cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? {|cup| cup.empty?} ||
    @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    player_one_cup = @cups[6].count
    player_two_cup = @cups[13].count

    if player_one_cup == player_two_cup
      :draw
    elsif player_one_cup > player_two_cup
      @name1
    else
      @name2
    end

  end
end
