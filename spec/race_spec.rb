require './lib/candidate'
require './lib/race'

RSpec.describe '#Race' do
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
  end
  describe '#setup' do
    it 'exists' do
      expect(@race).to be_instance_of Race
    end

    it 'has attributes' do
      expect(@race.office).to eq("Texas Governor")
      expect(@race.candidates).to eq([])
    end
  end

  describe '#Candidate Registration' do
    it 'can register candidates' do
      expect(@candidate1.class).to eq(Candidate)
    end
    
    it 'candidates have attributes' do
      expect(@candidate1.name).to eq("Diana D")
      expect(@candidate1.party).to eq(:democrat)
    end
    
    it 'can have multiple candidates' do
      @race.register_candidate!(@candidate1)
      @race.register_candidate!(@candidate2)
      expect(@race.candidates).to eq([@candidate1, @candidate2])
      expect(@race.candidates.count).to eq(2)
      # require 'pry'; binding.pry
    end
  end

  describe '#Race conditions' do
    it 'is either open or closed' do
      expect(@race.open?).to be true  
      
      @race.close!

      expect(@race.open?).to be false
      require 'pry'; binding.pry
    end

    it 'has a winner' do
      @race.register_candidate!(@candidate1)
      @race.register_candidate!(@candidate2)

      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!

      expect(@race.winner).to be false

      expect(@race.winner).to eq(candidate1)
    end
  end
end