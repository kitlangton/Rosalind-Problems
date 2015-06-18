require_relative 'mendels_first_law'

describe Punnett do
  it "does" do
    o1 = Organism.new(type:"heterozygous")
    o2 = Organism.new(type:"homozygous_recessive")
    expect(Punnett.for(o1,o2)).to eq (2/4.0)
  end
end

describe ProbabilityTree do
  it "calculates" do
    expect(ProbabilityTree.for(2,2,2)).to eq 0.7833
  end
end
