require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize(beat1 = nil)
    @head = Node.new(beat1)
    @list = @head
  end

  def print_list
    if head.data.nil?
      return nil
    else
      final_string = ""
      current = @head
      until current == find_tail
        final_string << "#{current.data} "
        current = current.next_node
      end
      final_string << "#{find_tail.data}"
      final_string
    end
  end

  def find_tail
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def append(new_beat)
    if @head.data.nil?
      @head.data = new_beat
    else
      new_node = Node.new(new_beat)
      tail = find_tail
      tail.next_node = new_node
    end
  end

  def prepend(new_beat)
    if @head.data.nil?
      @head.data = new_beat
    else
      new_node = Node.new(new_beat)
      new_node.next_node = @head
      @head = new_node
    end
  end

  def insert(index, new_beat)
    current = @head
    new_node = Node.new(new_beat)
    # find one to prepend
    node_that_new_points_at = find_position_to_insert(index)
    new_node.next_node = node_that_new_points_at
    # find one to append
    node_that_points_at_new = find_position_to_insert(index - 1)
    node_that_points_at_new.next_node = new_node
  end

  def find_position_to_insert(index)
    current = @head
    index.times do
      current = current.next_node
    end
    current
  end

  def includes?(input)
    current = @head
      loop do
        current = current.next_node
      break if current.data == input || current == find_tail
      end
    current.data == input
  end

  def pop(number)
    elements_popped = []
    number.times do
      elements_popped << find_tail.data
      to_pop = find_node_that_points_to_tail
      to_pop.next_node = nil
    end
    elements_popped.reverse.join(" ")
  end

  def find_node_that_points_to_tail
    current = @head
    until current.next_node == find_tail
      current = current.next_node
    end
    current
  end

  def count
    print_list.split(" ").length
  end

  def find(index, number_elements)
    count = 0
    current = @head
    until count == index
      current = current.next_node
      count += 1
    end
    
    final_output = ""
    number_elements.times do
      final_output << "#{current.data} "
      current = current.next_node
    end
    final_output.strip
  end

end
