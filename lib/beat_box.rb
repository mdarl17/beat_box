require './lib/beat_box'
require './lib/linked_list'
require './lib/node'
require 'pry'

class BeatBox

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end
  
  def append(data)
    if data.split(" ").length > 1
      data.split(" ").each{ |beat|
        self.list.append(beat)
    }
    else
      self.list.append(data)
    end
  end

  def count
    self.list.count
  end
  
  def play
    beats = self.list.to_string
    `say -r 350 -v Boing #{beats}`
  end
end

bb = BeatBox.new
bb.append('deep doo ditt woo hoo shu')
binding.pry

