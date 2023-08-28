require './lib/linked_list'
require './lib/node'
require 'pry'

class BeatBox

  attr_reader :list, :all
  attr_accessor :rate, :voice

  def initialize(data=nil)
    @list = LinkedList.new(data)
    @rate = 500
    @voice = 'Boing'
    @all = @list.to_string
  end

  def get_valid_beats(data)
    valid_beats = ['tee','dee','deep','bop','boop','la','na']
    data_arr = data.split(" ")
    if data_arr.length > 0
      new_beats = data_arr.select{ |beat|
        valid_beats.include?(beat) || beat.length <= 6
      }
      return new_beats
    end
  end

  def append(data)
    valid_arr = get_valid_beats(data)
    if valid_arr.length > 0
      valid_arr.each{ |beat|
        @list.append(beat)
      }
    end
  end

  def prepend(data)
    valid_arr = get_valid_beats(data)
    if valid_arr.length > 0
      valid_arr.each{ |beat|
        @list.prepend(beat)
      }
    end
  end

  def count
    @list.count
  end
  
  def play
    # beats = @list.to_string
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
  end

  def reset_rate
    @rate = 500
  end
  
  def reset_voice
    @voice = 'Boing'
  end
end

bb = BeatBox.new
# bb.append('Mmm bop buh do buh dop
# Ba do bop buh do buh dop
# Ba do bop buh do buh dop
# Ba doo oooh yeahhhh')
bb.append('tee')
# p bb.all
# p bb.list.to_string
# p bb.all
bb.rate = 200
bb.voice = 'Moira'
# bb.play
bb.reset_rate
bb.reset_voice
p bb.count
p bb.all

# bb.prepend('tee tee tee deep')
# bb.append('deep doo ditt Mississippi woo hoo shu')
p bb.list.to_string
puts bb.count
p bb.all
# binding.pry

