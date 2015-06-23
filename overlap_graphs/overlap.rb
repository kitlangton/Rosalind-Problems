
class OverlapGraph
  def initialize(input)
    @data = Fastafarian::FastaParser.parse(input)
  end

  def adjaceny_list
    edges = []
    @data.combination(2) do |f1,f2|
      if check_overlap(f1,f2)
        edges << [f1, f2]
      end
      if check_overlap(f2,f1)
        edges << [f2,f1]
      end
    end
    p edges
    edges.map {|pair| pair.join(" ")}.join("\n")
  end

  def check_overlap(f1,f2)
    return false if f1.strand == f2.strand
    if f1.strand[-3..-1] == f2.strand[0..2]
      return true
    end
    false
  end
end
