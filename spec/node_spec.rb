require './lib/node'

describe Node do
  it 'exists' do
    node = Node.new
    expect(node).to be_a Node
  end
  it 'holds a single element of data' do
    node = Node.new('plop')
    expect(node.data).to eq('plop')
  end
  it 'holds a link to another node' do
    node = Node.new('plop')
    expect(node.next_node).to eq(nil)

    node_1 = Node.new('bang')
    node_2 = Node.new('boom')

    node_1.next_node = node_2

    expect(node_1.data).to eq('bang')
    expect(node_1.next_node).to be_a Node
    expect(node_1.next_node.data).to eq('boom')
  end
end
