class ItemLevel
  # This class represents a generic tool to handle the levels of each thing, like the industry level and the warehouse level
  # The target of separating it; is to make it more generic and abstract, so we can easily
  def initialize(metal, fibre, gas)
    # It initialize the level's minimum requirements
    @metal = metal
    @fibre = fibre
    @gas = gas
  end

  def update
    @metal = @metal + 20.00*@metal/100.00
    @fibre = @fibre + 20.00*@fibre/100.00
    @gas = @gas + 20.00*@gas/100.00
  end

  def can_be_reached(metal, fibre, gas)
    metal >= @metal and fibre >= @fibre and gas >= @gas
  end

  def get_level_difference(metal, fibre, gas)
    # Returns the difference between two levels
    difference = {
        "metal" => metal - @metal,
        "fibre" => fibre - @fibre,
        "gas" => gas - @gas
    }
    return difference
  end

end


class InnGame
  def initialize
    # It initialize the players stamina...
    @over_all_metal = 1500
    @over_all_fibre = 600
    @over_all_gas = 0
    @level_metal = 1500
    @level_fibre = 600
    @level_gas = 0

    @warehouse_level = 1
    @industry_level = 1
    @next_warehouse_level = ItemLevel.new(1000, 500, 100)
    @next_industry_level = ItemLevel.new(1500, 500, 0)
    @time = 0 #This variable indicates the time in minutes, so if it's 15, this does mean that quarter an hour passed since the player started playing!
  end

  def power_up
    # This is the function that will be periodically executed each minute, it does add some stamina to our power
    # As our industries generate 2000 metals, 1000 fibre and 20 gasoline every minute.
    @over_all_metal += 2000
    @over_all_fibre += 1000
    @over_all_gas += 20

    @level_metal += 2000
    @level_fibre += 1000
    @level_gas += 20
  end

  def reached_the_target
    # A boolean function which says if we reached the target or not yet
    @over_all_metal >= 50000 and @over_all_fibre >= 30000 and @industry_level >= 8 and @warehouse_level >= 10
  end

  def add_minute
    # This function works as a time simulator, each time this function is called, this means that the time increased by one minute!
    @time += 1
    power_up
  end

  def warehouse_level_up
    # A function to check if we can do a level up for the warehouse or not, if we can, we do this immediately
    if @next_warehouse_level.can_be_reached(@level_metal, @level_fibre, @level_gas)
      difference = @next_warehouse_level.get_level_difference(@level_metal, @level_fibre, @level_gas)
      @level_metal = difference["metal"]
      @level_fibre = difference["fibre"]
      @level_gas = difference["gas"]

      @next_warehouse_level.update
      @warehouse_level += 1
      return TRUE
    end
      return FALSE
  end

  def industry_level_up
    # A function to check if we can do a level up for the warehouse or not, if we can, we do this immediately
    if @next_industry_level.can_be_reached(@level_metal, @level_fibre, @level_gas)
      difference = @next_industry_level.get_level_difference(@level_metal, @level_fibre, @level_gas)
      @level_metal = difference["metal"]
      @level_fibre = difference["fibre"]
      @level_gas = difference["gas"]

      @next_industry_level.update
      @industry_level += 1
      return TRUE
    end
      return FALSE
  end

  def play
    # The Game Loop!
    while reached_the_target == FALSE do
      warehouse_up = warehouse_level_up
      industry_up = industry_level_up
      add_minute
      puts ("You spend #{@time} minute(s) playing the InnGame!")
      puts("Your stamina is:\n
          Metal => #{@level_metal}\n
          Fibre => #{@level_fibre}\n
          Gas => #{@level_gas}\n
          Warehouse level => #{@warehouse_level}\n
          Industry level => #{@industry_level}")
      if warehouse_up
        puts("Congratulations for the level up in the warehouse!")
      end
      if industry_up
        puts("Congratulations for the level up in the industry!")
      end
      puts ("="*50)
    end
    puts("Congratulations! You finished the game in #{@time} minute(s), your scores are:\n
          Overall Metal => #{@over_all_metal}\n
          Overall Fibre => #{@over_all_fibre}\n
          Overall Gas => #{@over_all_gas}\n
          Warehouse level => #{@warehouse_level}\n
          Industry level => #{@industry_level}")
  end

end
