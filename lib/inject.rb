class Array

  def itrinject(*args)
    if args.first.is_a?(Symbol) 
      tempvalue = self.first 
      self.shift
      self.each { |item| tempvalue = tempvalue.send(args.first, item) }
    elsif args[1].is_a?(Symbol) then
      tempvalue = args.first
      self.each { |item| tempvalue = tempvalue.send(args[1], item) }
    elsif args.empty? then
      tempvalue = self.first
      self.shift
      self.each { |n| tempvalue = yield tempvalue, n }
    elsif args.count == 1 && !args.first.is_a?(Symbol) then
      tempvalue = args.first
      self.each { |n| tempvalue = yield tempvalue, n }
    end
    tempvalue
  end

  def recinject(*args)
    if args.first.is_a?(Symbol) 
      tempvalue = self.first 
      self.shift
      self.each { |item| tempvalue = tempvalue.send(args.first, item) }
    elsif args[1].is_a?(Symbol) then
      tempvalue = args.first
      self.each { |item| tempvalue = tempvalue.send(args[1], item) }
    elsif args.empty? then
      tempvalue = self.first
      self.shift
      self.each { |n| tempvalue = yield tempvalue, n }
    elsif args.count == 1 && !args.first.is_a?(Symbol) then
      tempvalue = args.first
      self.each { |n| tempvalue = yield tempvalue, n }
    end
    tempvalue
  end

end
