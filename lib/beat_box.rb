require './lib/linked_list'
require './lib/node'
require 'pry'

class BeatBox

  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(data=nil)
    @list = init_list(data)
    @rate = 500
    @voice = 'Boing'
  end

  def init_list(data)
    if data
      list = LinkedList.new
      list.head = list.append(data)
      return list
    else
      return LinkedList.new
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

  def all
    @list.to_string
  end

  def count
    @list.count - 1
  end
  
  def play
    `say -r #{@rate} -v #{@voice} '#{@list.to_string}'`
  end

  def reset_rate
    @rate = 500
  end
  
  def reset_voice
    @voice = 'Boing'
  end
end

bb = BeatBox.new

# bb_2 = BeatBox.new('mmm bop')
bb.append('womp')
bb.prepend('doo')
# bb.append('ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom Mississippi')
# bb.voice = "Cellos"
bb.rate = 100
bb.voice = 'Cellos'
bb.play
# bb_2.play
p "bb.all => #{bb.all}"
# p bb_2.all
binding.pry

