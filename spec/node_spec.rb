require './lib/node'

describe Node do
  it 'exists' do
    node = Node.new('plop')
    expect(node).to be_a Node
  end
  it 'stores data' do
    node = Node.new('plop')
    expect(node.data).to eq('plop')
  end
  it 'can link to another node' do
    node = Node.new('plop')
    expect(node.next_node).to eq(nil)

    node_1 = Node.new('bang')
    node_2 = Node.new('boom')

    node_1.next_node = node_2

    expect(node_1.next_node).to be_a Node
    expect(node_1.next_node.data).to eq('boom')
  end
end
