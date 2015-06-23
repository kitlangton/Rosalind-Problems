class Consensus

  def self.process_input(input)
    new_input = []
    input.each_line do |line|
      if line =~ /^>/
        new_input << "\n"
      else
        new_input << line.strip
      end
    end
    new_input.join
  end

  def self.for(input)
    profile = get_profile(process_input(input))

    print = []
    print << print_consensus(profile)
    print << print_profile(profile)
    print.join("\n")
  end

  def self.print_consensus(profile)
    consensus = []
    profile.each do |index,values|
      consensus << values.max_by{|k,v| v}[0]
    end
    consensus.join
  end

  def self.print_profile(profile)
    print = []
    %w(A C G T).each do |base|
      line = []
      line << "#{base}:"
      profile.each do |position,values|
        line << values[base]
      end
      print << line.join(" ")
    end
    print
  end

  def self.get_profile(input)
    profile = Hash.new {|h,k| h[k] = Hash.new(0)}
    input.each_line do |line|
      next if line =~ /^>/
      line.chars.each_with_index do |char,index|
        next if char == "\n"
        profile[index+1][char] += 1
      end
    end
    profile
  end
end
