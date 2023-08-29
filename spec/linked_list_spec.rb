require './lib/linked_list'

describe LinkedList do
  it 'exists' do
    list = LinkedList.new
    expect(list).to be_a LinkedList
  end

  it 'can hold a head node after it is instantiated' do
    list = LinkedList.new
    list.append('doop')
    expect(list.head).to be_a Node
    expect(list.head.data).to eq('doop')
    expect(list.head.next_node).to be nil
  end

  it 'can add a node to the front of the list' do
    list = LinkedList.new
    list.append('doo')
    expect(list.head.data).to eq('doo')
    list.prepend('womp')
    expect(list.head.data).to eq('womp')
    expect(list.head.data == 'doo').to be false
    expect(list.to_string).to eq('womp doo')
  end

  it 'can insert a node anywhere in the list' do
    list = LinkedList.new
    list.append('doo')
    list.append('womp')
    list.append('tee')
    list.append('dah')
    list.append('doo')
    list.insert(3,'tee')
    expect(list.to_string.split(" ")[3]).to eq('tee')
    expect(list.get_node(3).data).to eq('tee')
  end

  it 'can ouput a string with data held by every node on the list' do
    list = LinkedList.new
    list.append('doo')
    list.append('womp')
    list.append('tee')
    list.append('dah')
    expect(list.to_string).to eq('doo womp tee dah')
  end

  it 'can output an integer with the total number of nodes in the list' do
    list = LinkedList.new
    list.append('doo')
    list.append('womp')
    list.append('tee')
    list.append('dah')
    expect(list.count).to eq(4)
  end

  it 'can remove and return the last node on the list' do
    list = LinkedList.new
    list.append('doo')
    list.append('womp')
    list.append('tee')
    list.append('dah')
    expect(list.pop.data).to eq('dah')
    expect(list.pop).to be_a(Node)
    expect(list.to_string).to eq('doo womp')
    expect(list.count).to eq(2)
    popped_node = list.pop
    expect(popped_node.data).to eq('womp')
    expect(popped_node).to be_a(Node)
  end

  it 'can find a range of nodes and return a string with the data each one is storing' do
    list = LinkedList.new
    list.append('doo')
    list.append('womp')
    list.append('tee')
    list.append('dah')
    expect(list.find(1,3)).to eq('womp tee dah')
  end

  it 'can determine if a node in the list stores a specific value' do
    list = LinkedList.new
    list.append('doo')
    list.append('womp')
    list.append('tee')
    list.append('dah')
    expect(list.includes?('tee')).to be true
    expect(list.includes?('doowop')).to be false
  end
end

