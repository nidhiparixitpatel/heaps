class HeapNode
  attr_reader :key, :value
  # compare by key, priority field
  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    new_node_index = @store.length
    @store.push(new_node)
    heap_up(@store.length - 1)
    
    return new_node
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    removed = @store[0].value
    swap(0, @store.length - 1)
    @store.pop
    heap_down(0)
    return removed
  end 


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  def find_parent(index)
    parent_index = (index - 1)/2
    return parent_index
  end

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    puts to_s
    parent_index = find_parent(index)
    if @store[parent_index].key <= @store[index].key || index == 0
      return
    end 
    if @store[parent_index].key > @store[index].key
      # puts  @store[index].value
      swap(parent_index, index)
      index = parent_index
      heap_up(index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    puts 'heap down'
    puts to_s
    child_index = 2*index + 1
    if index >= @store.length - 1 || child_index >= @store.length - 1
      return
    end
    if @store[child_index].key >= @store[index].key
      return
    end 
    if @store[child_index].key < @store[index].key
      swap(child_index, index)
      index = child_index
      heap_down(index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end