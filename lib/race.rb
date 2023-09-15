class Race
  attr_reader :office, :candidates, :open

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(option)
    @candidates << option
  end

  def open?
    @open
  end

  def close!
    @open = !@open 
  end

  def winner
    return false if @open
    sorted_votes = @candidates.sort_by { |candidate| candidate.votes }
    
    if sorted_votes[0].votes == sorted_votes[1].votes
      return "It's a tie!"
    else
      return sorted_votes[-1]
    end
  end
end