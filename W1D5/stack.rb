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
    @stack
  end
end

p a = Stack.new
p a.add(1)
p a.add(2)
p a.add(3)
p a.show
p a.remove
p a.show
