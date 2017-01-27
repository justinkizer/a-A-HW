class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if has_key?(key)
      @map[keys.index(key)][1] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    if has_key?(key)
      @map[keys.index(key)][1]
    end
  end

  def remove(key)
    @map.delete_at(keys.index(key))
  end

  def show
    @map
  end

  def keys
    @map.flatten.select.with_index { |_,i| i.even?}
  end

  def values
    @map.flatten.select.with_index { |_,i| i.odd?}
  end

  def has_key?(key)
    keys.include?(key)
  end

  def has_value?(value)
    values.include?(value)
  end

end

p a = Map.new
p a.assign("a", 1)
p a.assign("b", 2)
p a.assign("c", 3)
p a.assign("d", 4)
p a.assign("d", 4)
p a.assign("b", 9)
p a.show
p a.lookup("c")
p a.lookup("b")
p a.show
p a.remove("c")
p a.remove("a")
p a.show
p a.lookup("c")
p a.lookup("a")
