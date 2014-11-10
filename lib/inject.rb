class Array

  def itrinject(*args, &block)
    tempvalue = self[0] if args[0].is_a?(Symbol) || args.empty?
    tempvalue = args[0] if !args[0].is_a?(Symbol) && !args[0].nil? 
    args.map{ |arg| block = arg.to_proc if arg.is_a?(Symbol) }
    arr = self
    arr.shift if args[0].is_a?(Symbol) || args.empty?
    arr.each { |n| tempvalue = block.call tempvalue, n }
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
