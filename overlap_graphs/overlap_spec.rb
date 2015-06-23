require_relative 'overlap'
require 'fastafarian'

describe OverlapGraph do

  it "returns adjaceny lists" do
    input = <<-_EOF_
>Rosalind_0498
AAATAAA
>Rosalind_2391
AAATTTT
>Rosalind_2323
TTTTCCC
>Rosalind_0442
AAATCCC
>Rosalind_5013
GGGTGGG
    _EOF_

    output = <<-_EOF_
Rosalind_0498 Rosalind_2391
Rosalind_0498 Rosalind_0442
Rosalind_2391 Rosalind_2323
_EOF_
    test = OverlapGraph.new(input)
    expect(test.adjaceny_list).to eq output.chomp
  end
end
