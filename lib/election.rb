class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []

  end

  def add_race(race)
    @races << race
  end

  def candidates
    conmen = @races.map do |race|
      race.candidates
    end.flatten
  end

  def vote_counts
    rigged = {}
    
    @races.flat_map do |race|
      race.candidates.each do |candidate|
        rigged[candidate.name] = candidate.votes
      end
    end
    rigged
  end
end