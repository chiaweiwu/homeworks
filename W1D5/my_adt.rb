class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end


class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    # create key if it doesn't exisit yet
    # if key already exist update value
    # nested array so to get into each pair we need map[0]
    pairs_idx = @map.find_index {|pairs| pairs[0] == key} #this would give us the pair idx we need to create keys

    if pairs_idx
      @map[pairs_idx][key] = value
    else
      @map.push([key,value])
    end

  end

  def lookup(key)
    @map.each {|pairs| return pairs[1] if pairs[0] == key}
  end

  def remove(key)
    @map.delete_if {|pairs| pairs[0] == key}
  end

  def show
    @map.dup
  end
end


p map = Map.new
p map.assign(5,"k")
p map.assign(3,"k")
p map.lookup(5)
p map.remove(5)
p map.show
