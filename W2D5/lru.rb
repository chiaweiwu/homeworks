class LRUCache
 def initialize
   @data = []
   @limit = limit
 end

 def count
   # returns number of elements currently in cache
   @data.count
 end

 def add(el)
   # adds element to cache according to LRU principle
   if @data.include?(el)
     @data.delete(el)
     @data << el
   elsif count >= limit
     @data.shift
     @data << el
   else
    @data << el
   end
 end

 def show
   # shows the items in the cache, with the LRU item first
   @data
 end

end
