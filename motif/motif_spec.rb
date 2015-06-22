require_relative 'motif'

describe Motif do
  it 'returns all occurences of substring within the given string' do
    string = "GTGATGGTGGCAGATGGTGCTGCCACCGATGGTGCACGATGGTGTCCATTCAACGATGGTGCACGGAGATGGTGCAGATGGTGTGATGTGATGGTGTTCAGATGGTGGATGGTGGATGGTGGATGGTGCACGATGGTGGATGGTGAGATGGTGGCCGGATGGTGGTGCGAATCCGATGGTGGATGGTGGTCAGGCATGATGGTGGATGGTGAAACTAATATCTCTGCAAGATGGTGAGGATGGTGGATGGTGGATGGTGGGATGGTGGATGGTGGATGGTGTTTGCTGCGTGAGATGGTGCAGATGGTGGATGGTGCGATGGTGCAAGATGGTGGTTGATGGTGTTGATGGTGTGATGGTGGCCGATGGTGGGATGGTGAAGATGGTGACGATGGTGTGATGGTGATAAACCTGGATGGTGTGATGGTGGATGGTGGTGATGGTGTCTCGTCGGCCGATGGTGAGTGATGGTGTTAGATGGTGCCCACGATGGTGGATGGTGTGATGGTGGATGGTGGATGGTGGTAGCTTTATTTGGATGGTGCTATAGTTGACGATGGTGCCAGATGGTGGATGGTGAACGATGGTGGGATGGTGAATGTGATGGTGGGATGGTGGGTCGATGGTGGATGGTGGGATGGTGGCGATGGTGTAATGATGGTGCAGTGATGGTGCTGATGGTGAGATGGTGGGTTCGATGGTGGATGGTGCGATGGTGGATGGTGTTGATGGTGGATGGTGCTTTAGGTGATGGTGTGATGGTGCTTGGATGGTGACCGATGGTGAGGATGGTGAGCGATGGTGGCCAAAAGATGGTGCTGTGAGAGATGGTGGATGGTGGATGGTGCACCGATGGTGGATGGTGTCGATGGTGGATGGTGAACCTAGGATGGTGAGATGGTGGATGGTGCGATGGTGACTACAGATGGTGTAATAG"
    substring = "GATGGTGGA"

    expect(Motif.for(string,substring)).to eq "2 4 10"
  end
end
