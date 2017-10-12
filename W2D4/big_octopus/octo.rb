# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octo(fish_arr)
  # quadratic search
  # usually comes in a nested loop

  fish_arr.each_with_index do |fish_one, idx1|
    max_length = true

    fish_arr.each_with_index do |fish_two, idx2|
      next if idx1 == idx2

      max_length = false if fish_two.length > fish_one.length

    end

    return fish_one if max_length

  end

end


class Array

  def merge_sort(&prc)
    # O(n log n)

    prc ||= Proc.new {|x,y| x <=>y}

    return self if length <= 1

    mid = length/2

    left_sort = self.take(mid).merge_sort(&prc)
    right_sort = self.drop(mid).merge_sort(&prc)

    Array.merge(left_sort,right_sort,&prc)

  end

  def merge(left,right,&prc)
    merged = []


    until left.empty? || right.empty?

      case prc.call(left.first,right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end

    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

end

def dominant_octo(fish_arr)
  Proc.new {|x,y| y.length <=> x.length}

  fish_arr.merge_sort(&prc)[0]
end


def clever_octo(fish_arr)
  # O(n) - Linear

  fish_arr.reduce do |longest,fish|
    if fish.length > longest.length
      longest = fish
    else
      longest
    end
  end

end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


def slow_dancing_octo(direction, tiles_array)
  # O(n) dance

  tiles_array.each_with_index do |dir, idx|
    return idx if dir == direction
  end

end

TILES = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dancing_octo(dirction, new_data_structure)
  # O(1) dance
  TILES[direction]
end
