require './lib/node'
require 'dead_end'
# require 'pry'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end
  def append(data)
    if !@head
      @head = Node.new(data)
    else
      append_to_tail(@head, data)
    end
    def append_to_tail(node, data)
      if !node.next_node
        node.next_node = Node.new(data)
      else
        append_to_tail(node.next_node, data)
      end
    end
    data
  end

  def count(node=@head, count=0)
    return count if !node
    count(node.next_node, count += 1)
  end

  def to_string(node=@head)
    return node.data if !node.next_node
    "#{node.data} #{to_string(node.next_node)}"
  end

  def prepend(data)
    if @head
      new_node = Node.new(data)
      new_node.next_node = @head
      @head = new_node
    else
      @head = Node.new(data)
    end
  end

  def insert(idx, data, node=@head)
    if idx > count || idx < 0
      puts "Sorry, value not in range."
      return
    end
    new_node = Node.new(data)
    if idx == 0
      new_node.next_node = @head
      @head = new_node
    elsif idx == 1
      new_node.next_node = node.next_node
      node.next_node = new_node
    else
      insert(idx-1, data, node.next_node)
    end
  end

  def find(idx,len)
    return 'Sorry, that is not a valid range.' if (idx + len) > count
    start_node = head
    node_str = ""
    idx.times {
      start_node = start_node.next_node
    }
    len.times {
      node_str = node_str + " " + start_node.data
      start_node = start_node.next_node
    }
    node_str.strip
  end

  def includes?(data)
    return false if data == nil
    cur_node = @head
    while cur_node
      if cur_node.data == data
        return true
      else
        cur_node = cur_node.next_node
      end
    end
    false
  end

  def pop
    def penult_node
      node = @head
      (count-2).times {
        node = node.next_node
      }
      popped = node.next_node
      node.next_node = nil
      popped.data
    end
    penult_node
  end
end