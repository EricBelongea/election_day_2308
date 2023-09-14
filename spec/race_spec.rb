require './lib/candidate'
require './lib/race'

RSpec.describe '#Race' do
  before(:each) do
    @race = Race.new("Texas Governor")
   
    # @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
  end
  describe '#step up' do
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
      @diana = Candidate.new({name: "Diana D", party: :democrat})
      @candidate1 = @race.register_candidate!(@diana)
      require 'pry'; binding.pry
      expect(@candidate1.class).to be_instance_of Candidate
    end
    
    xit 'candidates have attributes' do
      # @race.register_candidate!(@candidate1)
      expect(@candidate1.name).to eq("Diana D")
      expect(@candidate1.party).to eq(:democrat)
    end
    
    xit 'can have multiple candidates' do
      @race.register_candidate!(@candidate1)
      @race.register_candidate!(@candidate2)
      expect(@race.candidates).to eq([@candidate1, @candidate2])
      expect(@race.candidates.count).to eq(2)
    end
  end
end