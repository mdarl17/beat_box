require './lib/linked_list'
require './lib/node'
require 'pry'

class BeatBox

  attr_reader :list, :all

  def initialize(data=nil)
    @all = ['tee','dee','deep','bop','boop','la','na']
    @list = init_list(data)
  end
  
  def init_list(data)
    if data && self.list
      self.list.append(data)
    elsif data && !self.list
      @list = LinkedList.new.append(data)
    else
      @list = LinkedList.new
    end
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
    if valid_arr.length > 0
      valid_arr.split(" ").each{ |beat|
        @list.append(beat)
        add_to_all(beat)
      }
    end
  end

  def prepend(data)
    valid_arr = get_valid_beats(data)
    if valid_arr.length > 0
      data.split(" ").each{ |beat|
        @list.prepend(beat)
        add_to_all(beat)
      }
    end
  end

  def count
    self.list.count
  end
  
  def play
    beats = self.list.to_string
    `say -r 350 -v Boing #{beats}`
  end

  def add_to_all(data)
    @all << data if @all.include?(data)
  end
end

bb = BeatBox.new("deep")
bb.append('Mississippi womp woop bebop dowop')
p bb.list
p bb.all
# bb.prepend('tee tee tee deep')
# bb.append('deep doo ditt woo hoo shu')
# binding.pry

