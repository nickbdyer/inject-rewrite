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
        puts "Tempvalue: #{tempvalue}"
        self.shift
        puts "Self #{self}"
        return 0 if tempvalue == nil
        tempvalue = tempvalue.send(args.first, recinject(args.first)) unless self.first.nil?
    end
      tempvalue
  end

end
    # elsif args[1].is_a?(Symbol) then
    #   tempvalue = args.first
    #   self.each { |item| tempvalue = tempvalue.send(args[1], item) }
    # elsif args.empty? then
    #   tempvalue = self.first
    #   self.shift
    #   self.each { |n| tempvalue = yield tempvalue, n }
    # elsif args.count == 1 && !args.first.is_a?(Symbol) then
    #   tempvalue = args.first
    #   self.each { |n| tempvalue = yield tempvalue, n }
    # end
