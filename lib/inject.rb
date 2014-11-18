class Array

  def itrinject(*args, &block)
    arr = self.dup
    tempvalue = self[0] if args[0].is_a?(Symbol) || args.empty?
    tempvalue = args[0] if !args[0].is_a?(Symbol) && !args[0].nil? 
    args.map{ |arg| block = arg.to_proc if arg.is_a?(Symbol) }
    arr.shift if args[0].is_a?(Symbol) || args.empty?
    arr.each { |n| tempvalue = block.call tempvalue, n }
    tempvalue
  end



  def recinject(*args, &block)
    array = self.dup
    tempvalue, nextvalue = array.shift, 0 if args[0].is_a?(Symbol) || args.empty?
    tempvalue, nextvalue = args[0], 0 if !args[0].is_a?(Symbol) && !args[0].nil?
    args.map{ |arg| block = arg.to_proc if arg.is_a?(Symbol) }
    return tempvalue if array.empty?

    tempvalue = block.call tempvalue, array[nextvalue]

    array.drop(1).recinject(tempvalue, args, &block)
  end

end
