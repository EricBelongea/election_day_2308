require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe '#Election' do
  before(:each) do
    @election = Election.new('2050')
  end
  describe '#Election Setup' do
    it 'exists' do
      expect(@election).to be_instance_of Election
    end

    it 'has attributes' do
      expect(@election.year).to eq('2050')
      expect(@election.races).to eq([])
    end
  end

  describe '#Races' do
    it 'can add a race with candidates' do
      race1 = Race.new("Texas Governor")
      candidate1 = Candidate.new({name: "Diana D", party: :democrat})
      candidate2 = Candidate.new({name: "Roberto R", party: :republican})
      race1.register_candidate!(candidate1)
      race1.register_candidate!(candidate2)

      @election.add_race(race1)
      expect(@election.races).to eq([race1])
    end

    it 'list all candidates in election' do
      race1 = Race.new("Texas Governor")
      candidate1 = Candidate.new({name: "Diana D", party: :democrat})
      candidate2 = Candidate.new({name: "Roberto R", party: :republican})
      race1.register_candidate!(candidate1)
      race1.register_candidate!(candidate2)
      @election.add_race(race1)


      expect(@election.candidates).to eq([candidate1, candidate2])
    end
  end

  describe '#Counting votes' do
    it 'return vote counts' do
      race1 = Race.new("Texas Governor")
      candidate1 = Candidate.new({name: "Diana D", party: :democrat})
      candidate2 = Candidate.new({name: "Roberto R", party: :republican})
      race1.register_candidate!(candidate1)
      race1.register_candidate!(candidate2)
      @election.add_race(race1)

      expect(@election.vote_counts).to eq({"Diana D" => 0, "Roberto R" => 0})
    end

    it 'candidates can accumulate votes' do
      race1 = Race.new("Texas Governor")
      candidate1 = Candidate.new({name: "Diana D", party: :democrat})
      candidate2 = Candidate.new({name: "Roberto R", party: :republican})
      race1.register_candidate!(candidate1)
      race1.register_candidate!(candidate2)
      @election.add_race(race1)

      candidate1.vote_for!
      candidate1.vote_for!
      
      candidate2.vote_for!

      expect(@election.vote_counts).to eq({"Diana D" => 2, "Roberto R" => 1})
    end
  end
end