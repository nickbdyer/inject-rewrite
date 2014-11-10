require 'inject'

describe "Array" do

  let(:arr) {[2,3,4,5]}

  context "method Iterative Inject" do

    it "should compute addition as symbol" do
      expect(arr.itrinject(:+)).to eq 14
    end

    it "should compute multiplication as symbol" do
      expect(arr.itrinject(:*)).to eq 120
    end

     it "should compute subtraction as symbol" do
      expect(arr.itrinject(:-)).to eq -10
    end

    it "should compute addition with intial value and symbol" do
      expect(arr.itrinject(2, :+)).to eq 16
    end

    it "should compute multiplication with intial value and symbol" do
      expect(arr.itrinject(2, :*)).to eq 240
    end

    it "should compute addition as a block" do
      expect(arr.itrinject {|sum, n| sum + n }).to eq 14
    end

    it "should compute multiplication as a block" do
      expect(arr.itrinject {|product, n| product * n }).to eq 120
    end

     it "should compute addition as a block with an initial value" do
      expect(arr.itrinject(2) {|sum, n| sum + n }).to eq 16
    end

    it "should compute multiplication as a block with an initial value" do
      expect(arr.itrinject(2) {|product, n| product * n }).to eq 240
    end

    it "should find the longest word" do
      longest = %w{ cat sheep bear }
      ans = longest.itrinject { |memo, word| memo.length > word.length ? memo : word }
      expect(ans).to eq "sheep"      
    end

    it "should build a hash from nested arrays" do
      expect([[:first_name, 'Shane'], [:last_name, 'Harvie']].itrinject({}) do |result, element|
      result[element.first] = element.last
      result
      end).to eq ({:first_name=>"Shane", :last_name=>"Harvie"})
    end


  end

  context "method Recursive Inject" do

    # it "should compute addition as symbol" do
    #   expect(arr.recinject(:+)).to eq 14
    # end

    # it "should compute multiplication as symbol" do
    #   expect(arr.recinject(:*)).to eq 120
    # end

    # it "should compute subtraction as symbol" do
    #   expect(arr.recinject(:-)).to eq -10
    # end

    # it "should compute addition with intial value and symbol" do
    #   expect(arr.recinject(2, :+)).to eq 16
    # end

    # it "should compute multiplication with intial value and symbol" do
    #   expect(arr.recinject(2, :*)).to eq 240
    # end

    # it "should compute addition as a block" do
    #   expect(arr.recinject {|sum, n| sum + n }).to eq 14
    # end

    # it "should compute multiplication as a block" do
    #   expect(arr.recinject {|product, n| product * n }).to eq 120
    # end

    #  it "should compute addition as a block with an initial value" do
    #   expect(arr.recinject(2) {|sum, n| sum + n }).to eq 16
    # end

    # it "should compute multiplication as a block with an initial value" do
    #   expect(arr.recinject(2) {|product, n| product * n }).to eq 240
    # end

    # it "should find the longest word" do
    #   longest = %w{ cat sheep bear }
    #   ans = longest.recinject { |memo, word| memo.length > word.length ? memo : word }
    #   expect(ans).to eq "sheep"      
    # end
    
  end

end