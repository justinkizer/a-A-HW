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
    @queue
  end
end

p a = Queue.new
p a.enqueue(1)
p a.enqueue(2)
p a.enqueue(3)
p a.show
p a.dequeue
p a.show
