require './lib/beat_box'

describe BeatBox do
  it 'exists' do
    bb = BeatBox.new
    expect(bb).to be_instance_of(BeatBox)
  end
end