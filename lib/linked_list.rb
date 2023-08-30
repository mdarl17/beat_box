require './lib/node'
require 'dead_end'

class LinkedList

  attr_accessor :head
  def initialize
    @head = nil
  end
  # Helper function to get a node's position on LinkedList

  def get_node(pos)
    node = @head
    pos.times{
      node = node.next_node
    }
    node
  end
  
  def append(data)
    return self if !data
    insert(count, data)
  end

  def prepend(data)
    insert(0, data)
  end

  def insert(idx, data)
    if idx > count || idx < 0
      puts "Sorry, #{idx} value not in range of #{count} nodes"
    end

    if idx == 0
      new_node = Node.new(data)
      new_node.next_node = @head
      @head = new_node
    else
      new_node = Node.new(data)
      prev_node = get_node(idx-1)
      back_node = prev_node.next_node
      prev_node.next_node = new_node
      new_node.next_node = back_node
    end
  end

  def count(node=@head, count=0)
    return count if !node
    count(node.next_node, count += 1)
  end

  def to_string(node=@head)
    return "" if !node
    "#{node.data} #{to_string(node.next_node)}".strip
  end

  def find(idx,len)
    return 'Please enter a valid range.' if (idx + len) > count || idx < 0
    start_node = get_node(idx)
    node_str = ""
    len.times {
      node_str = "#{node_str} #{start_node.data}"
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
    new_tail = get_node(count-2)
    popped = new_tail.next_node
    new_tail.next_node = nil
    popped
  end
end