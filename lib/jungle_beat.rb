require_relative 'linked_list'


class JungleBeat
  attr_accessor :list
  def initialize(beat)
    @beats = beat.split(" ")
    @list = LinkedList.new(@beats[0])
    i = 1
    while i < @beats.length
      @list.append(@beats[i])
      i += 1
    end
  end

  def play
    `say -r 400 -v Boing "#{@list.print_list}"`
    puts "Played #{@list.print_list.split(" ").length} sounds from the file"
  end

  def all
    @list.print_list
  end

  def append(input)
    beats = input.split(" ")
    beats.each do |beat|
      @list.append(beat)
    end
  end

  def prepend(input)
    beats = input.split(" ")
    i = (beats.length - 1)
    while i >= 0
      @list.prepend(beats[i])
      i = i - 1
    end
  end

  def insert(index, input)
    beats = input.split(" ")
    beats.each do |beat|
      @list.insert(index, beat)
      index += 1
    end
  end

  def includes?(input)
    @list.includes?(input)
  end

  def pop(number)
    @list.pop(number)
  end

  def count
    all.split(" ").length
  end

  def find(index, number_elements)
    @list.find(index, number_elements)
  end

end

# Testing
# jb = JungleBeat.new("deep dep dep deep")
# jb.play
