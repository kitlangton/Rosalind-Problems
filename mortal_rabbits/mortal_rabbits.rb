class RabbitRules
  def initialize(months,life_span)
    @rabbits = [Rabbit.new]
    @current_month = 1

    @months = months
    @life_span = life_span
  end

  def run
    until @current_month == @months do
      next_month
    end
    @rabbits.count
  end

  def next_month
    @rabbits.each_with_index do |rabbit,index|
      p @rabbits
      if reproduce?(rabbit)
        @rabbits << Rabbit.new
      end
      rabbit.next_month
      if die?(rabbit)
        @rabbits.delete_at(index)
      end
    end
    @current_month += 1
  end

  def die?(rabbit)
    rabbit.age >= @life_span
  end

  def reproduce?(rabbit)
    if rabbit.mature?
      true
    end
  end
end

class Rabbit

  attr_reader :age

  def initialize
    @age = 1
  end

  def next_month
    @age += 1
  end

  def mature?
    @age > 2
  end
end
