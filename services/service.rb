class Service
  def self.max_multiplication(value)
    return nil unless value.is_a? String
    value.scan(/(\d+)/).flatten
        .map {|x| x.scan(/\d/).map(&:to_i)}
        .map do |x|
      x.each_cons(4).map do |y|
        y.inject(:*)
      end
    end.flatten.max
  end

  def self.sort(values)
    item = Struct.new(:dec, :bin)
    values.compact
        .map {|x| item.new(x, x.to_s(2).count(?1))}
        .sort_by {|e| [e.bin, e.dec]}
        .map(&:dec)
  end
end