require './lib/node'
require 'dead_end'

class LinkedList

  attr_reader :head

  def initialize(data=nil)
    @head = Node.new(data)
  end

  def get_node(pos)
    node = @head
    pos.times{
      node = node.next_node
    }
    node
  end
  def append(data)
    if !@head
      @head = Node.new
      @head.data = data
    else
      get_node(count-1).next_node = Node.new(data)
    end
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
      puts "Sorry, #{idx} value not in range of #{count} nodes"
      return
    end
    new_node = Node.new(data)
    node_before = get_node(idx-1)
    node_behind = node_before.next_node
    node_before.next_node = new_node
    new_node.next_node = node_behind
  end

  def count(node=@head, count=0)
    return count if !node
    count(node.next_node, count += 1)
  end

  def to_string(node=@head)
    return nil if !node
    "#{node.data} #{to_string(node.next_node)}".strip
  end

  def find(idx,len)
    return 'Sorry, that is not a valid range.' if (idx + len) > count
    start_node = get_node(idx)
    node_str = ""
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
    new_tail = get_node(count-2)
    popped = new_tail.next_node
    new_tail.next_node = nil
    popped
  end
end

# list = LinkedList.new
# list.append('la')
# list.append('dee')
# list.append('da')
# list.append('doh')
# list.append('we')
# list.append('likes')
# list.append('to')
# list.append('party')
# p list.count
# p list.get_node(3).data
# list.insert(3,'ho')
# p list.count
# list.insert(6,'hum')
# p list.count
# p list.to_string
# p list.pop.data
# p list.count
# p list.to_string
# p list.find(0,8)