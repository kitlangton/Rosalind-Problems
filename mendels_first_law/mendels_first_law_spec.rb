require_relative 'mendels_first_law'

describe Punnett do
  it "does" do
    o1 = Organism.new(type:"heterozygous")
    o2 = Organism.new(type:"homozygous_recessive")
    expect(Punnett.punnett(o1,o2)).to be [4]
  end
end

describe ProbabilityTree do

end
