require './lib/linked_list'
require './lib/node'
require 'pry'

class BeatBox

  attr_reader :list, :all
  attr_accessor :rate, :voice

  def initialize(data=nil)
    @all = ['tee','dee','deep','bop','boop','la','na']
    @list = LinkedList.new(data)
    @rate = 500
    @voice = 'Boing'
  end

  def get_valid_beats(data)
    data_arr = data.split(" ")
    valid_beats = []
    if data_arr.length > 0
      valid_beats = data_arr.select{ |beat|
        @all.include?(beat) || beat.length <= 5
      }
    end
    valid_beats.each{ |beat|
      if !@all.include?(beat)
        @all << beat
      end
    }
    valid_beats.length > 0 ? valid_beats : nil
  end

  def append(data)
    valid_arr = get_valid_beats(data)
    if valid_arr
      valid_arr.each{ |beat|
        @list.append(beat)
        add_to_all(beat)
      }
    end
  end

  def prepend(data)
    valid_arr = get_valid_beats(data)
    if valid_arr
      valid_arr.each{ |beat|
        @list.prepend(beat)
        add_to_all(beat)
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

  def add_to_all(data)
    @all << data if !@all.include?(data)
  end

  def reset_rate
    @rate = 500
  end
  
  def reset_voice
    @voice = 'Boing'
  end
end

bb = BeatBox.new("deep")
bb.append('Mississippi')
p bb.list
p bb.all
p bb.list.to_string
bb.prepend("womp dowop dooop Mississippi")
p bb.list.to_string
p bb.all
bb.play
bb.rate = 100
bb.voice = 'Bruce'
bb.play
bb.reset_rate
bb.play
bb.reset_voice
bb.play
p bb.count

# bb.prepend('tee tee tee deep')
# bb.append('deep doo ditt woo hoo shu')
# binding.pry

