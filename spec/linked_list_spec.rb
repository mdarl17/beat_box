require './lib/linked_list'

describe LinkedList do
  it 'exists' do
    list = LinkedList.new
    expect(list).to be_a LinkedList
  end

  it 'might be instantiated with a `head` node' do
    list = LinkedList.new('bop')
    expect(list.head).to be_a Node
    expect(list.head.data).to eq('bop')
  end

  it 'can add a `head` with #append(data)' do
    list = LinkedList.new
    list.append('doop')
    expect(list.head).to be_a Node
    expect(list.head.data).to eq('doop')
    expect(list.head.next_node).to be nil
  end
end