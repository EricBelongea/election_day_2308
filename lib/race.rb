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
    if @open == true
      return false
    else
      if @candidates[]

    end
  end
end