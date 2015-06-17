
class ProbabilityTree
  def self.for(d,z,r)
    population = []
    d.times do
      population << Organism.new(type:"homozygous_dominant")
    end
    z.times do
      population << Organism.new(type:"heterozygous")
    end
    r.times do
      population << Organism.new(type:"homozygous_recessive")
    end
    odds = 0

    population.combination(2).each do |o1,o2|
      odds += Punnett.for(o1,o2)
    end

    odds / population.combination(2).to_a.count
  end
end

class Punnett
  def self.for(o1,o2)
    odds = 0
    o1.alleles.product(o2.alleles).each do |pair|
      if pair.any?{|x| x.inspect == "Y"}
        odds += 1
      end
    end
    odds / 4.0
  end
end

class Organism

  attr_reader :alleles, :type

  def initialize(type:"random")
    @type = type
    @alleles = generate_alleles
  end

  def inspect
    @type
  end

  private

  def generate_alleles
    case @type
    when "random"
      [random_allele,random_allele]
    when "homozygous_dominant"
      [dominant_allele,dominant_allele]
    when "homozygous_recessive"
      [recessive_allele,recessive_allele]
    when "heterozygous"
      [dominant_allele,recessive_allele]
    end
  end

  def dominant_allele
    Allele.new(dominant:true)
  end

  def recessive_allele
    Allele.new(dominant:false)
  end

  def random_allele
    random_boolean = [true,false].sample
    Allele.new(dominant:random_boolean)
  end
end

class Allele
  def initialize(dominant:false)
    @dominant = dominant
  end

  def dominant?
    if @dominant
      true
    end
  end

  def recessive?
    if !@dominant
      true
    end
  end

  def inspect
    if dominant?
      "Y"
    else
      "y"
    end
  end
end
