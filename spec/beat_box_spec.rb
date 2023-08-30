require './lib/beat_box'

describe BeatBox do
  describe 'instantiation' do
    it 'can be initialized without a beat' do
      bb = BeatBox.new
      expect(bb).to be_instance_of(BeatBox)
      expect(bb.list.head).to be nil
      expect(bb.count).to eq(0)
    end
    it 'can be initialized with a beat' do
      bb = BeatBox.new('woop')
      expect(bb).to be_instance_of(BeatBox)
      expect(bb.list.head.data).to eq('woop')
      expect(bb.count).to eq(1)
    end
  end

    it 'can add beats to the top of the list' do
      bb = BeatBox.new("tee tee dee")
      bb.prepend("doh ray me")
      expect(bb.all).to eq('doh ray me tee tee dee')
    end

    it 'can validate beats' do
      bb = BeatBox.new('woop tee dee da Mississippi')
      expect(bb.all).to eq('woop tee dee da')
    end

    it 'keeps count of how many beats are in the list' do
      bb = BeatBox.new('woop tee dee da Mississippi')
      expect(bb.count).to eq(4)
    end

    it 'can return a string of all of the beats in the list' do
      bb = BeatBox.new('woop tee dee da Mississippi')
      expect(bb.all).to eq('woop tee dee da')
    end

    it 'can play beats' do
      bb = BeatBox.new('woop tee dee da Mississippi')
      expect(bb.play).to eq(`say -r #{bb.rate} -v #{bb.voice} '#{bb.list.to_string}'`)
    end

    it 'can change the rate of the voice' do
      bb = BeatBox.new('woop tee dee da Mississippi')
      expect(bb.rate).to eq(500)
      bb.rate = 100
      expect(bb.rate).to eq(100)
      bb.play
    end

    it 'can change the voice' do
      bb = BeatBox.new('woop tee dee da Mississippi')
      expect(bb.voice).to eq('Boing')
      bb.voice = 'Cello'
      expect(bb.voice).to eq('Cello')
      bb.play
    end
end