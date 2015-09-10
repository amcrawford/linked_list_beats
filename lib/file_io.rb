require_relative 'jungle_beat'

class FileOpener
  attr_accessor :input

  def initialize(input)
    @input = File.open(ARGV[0]).read
  end

  def play_beats
    player = JungleBeat.new(@input)
    player.play
  end

end

file = FileOpener.new(ARGV[0])
file.play_beats
