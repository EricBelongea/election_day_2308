require './lib/candidate'
require './lib/race'

RSpec.describe '#Race' do
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
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
    end
  end
end