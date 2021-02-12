fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#  O(n^2) 
def sluggish(fish)
  (0..fish.length - 1).each do |i|
    longest = true
    (0..fish.length - 1).each do |j|
      longest = false  if i != j && fish[j].length > fish[i].length 
    end
    return fish[i] if longest 
  end
end

p sluggish(fish)

class Array 
  def merge_sort(&prc)
    prc ||= Proc.new {|a,b| a<=>b}
    return self if self.length <= 1
    index = self.length / 2
    left = self[0...index].merge_sort(&prc)
    right = self[index..self.length - 1].merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private 
  def self.merge(left, right, &prc)
    res = []
    until left.empty? || right.empty?
      res << (prc.call(left[0], right[0]) == -1 ? left.shift : right.shift)
    end
    res + left + right 
  end
end

def dominant(fish)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fish.merge_sort(&prc)[-1]
end

p dominant(fish)

def clever(fish)
  longest = fish[0]
  (0...fish.length).each do |i|
    if fish[i].length > longest.length 
      longest = fish[i]
    end
  end
  longest
end

p clever(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir,tiles_array)
  tiles_array.each_with_index do |ele, i|
    return i if dir == ele 
  end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)


tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5 , "left" => 6 ,  "left-up" => 7}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)