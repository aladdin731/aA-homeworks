class Board


  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2 
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |i|
      next if i == 6 || i == 13
      4.times do
        cups[i] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).include?(start_pos) 
    # should have stones in the start_pos
    raise "Starting cup is empty" if cups[start_pos].empty? 
  end

  def make_move(start_pos, current_player_name)
    num_stones = cups[start_pos].length 
    cups[start_pos] = []
    cur_pos = start_pos
    opponent_points_cup_pos = current_player_name == @name1 ? 13 : 6
    while num_stones > 0
      cur_pos = (cur_pos + 1)%14
      next if cur_pos == opponent_points_cup_pos
      cups[cur_pos] << :stone 
      num_stones -= 1
    end
    end_pos = cur_pos
    render 
    next_turn(end_pos) 
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
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
    (0..5).all? {|i| cups[i].empty?} || (7..12).all? {|i| cups[i].empty?}
  end

  def winner
    return :draw if cups[6].length == cups[13].length 
    return cups[6].length > cups[13].length ? @name1 : @name2 
  end
end
