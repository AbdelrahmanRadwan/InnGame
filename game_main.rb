
class InnGame

  def initialize
    # It initialize the players stamina...
    @metal = 1500
    @fibre = 600
    @gas = 0
    @warehouse_level = 1
    @industry_level = 1
    @time = 0 #This variable indicates the time in minutes, so if it's 15, this does mean that quarter an hour passed since the player started playing!
  end

  def power_up
    # This is the function that will be periodically executed each minute, it does add some stamina to our power
    # As our industries generate 2000 metals, 1000 fibre and 20 gasoline every minute.
    @metal += 2000
    @fibre += 1000
    @gas += 20
  end

  def reached_the_target
    # A boolean function which says if we reached the target or not yet
    @metal >= 5 and @fibre >= 20 and @industry_level >= 10 and @warehouse_level >= 15
  end

  def play
    # The Game Loop!
  end

end
