class Array

  def itrinject(*args, &block)
    tempvalue = self.first if args.first.is_a?(Symbol) || args.empty?
    tempvalue = args.first if !args.first.is_a?(Symbol) && !args.first.nil? 
    block = args.first.to_proc if args.first.is_a?(Symbol)
    block = args[1].to_proc if args[1].is_a?(Symbol)
    self.shift if args.first.is_a?(Symbol) || args.empty?
    self.each { |n| tempvalue = block.call tempvalue, n }
    tempvalue
  end


  def recinject(initialvalue = nil, *args, &block)
    return 0 if self.empty?

    initialvalue = self[0] if args.first.is_a?(Symbol)
    initialvalue = initialvalue if args[1].is_a?(Symbol)
    block = args.first.is_a?(Symbol) ? args[0] : args[1]
    initalvalue = initialvalue.send(block, self[nextvalue])
    recinject(initialvalue, args, &block)
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
