
class ProbabilityTree

end

class Punnett
  def self.for(o1,o2)
    o1.alleles.product(o2.alleles)
  end
end

class Organism

  attr_reader :alleles, :type

  def initialize(type:"random")
    @type = type
    @alleles = generate_alleles
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
