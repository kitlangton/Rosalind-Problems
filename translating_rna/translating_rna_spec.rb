require_relative 'translating_rna'

describe Translating_RNA do
  it 'creates a protein string from a given RNA string' do
    expect(Translating_RNA.translate("AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA")).to eq "MAMAPRTEINSTRING"
  end
end
