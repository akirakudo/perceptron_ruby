module PerceptronRuby
  class Neuron
    attr_reader :output

    def initialize(inputs = [0,0])
      @inputs = Array.new(inputs)
      @weights = Array.new(inputs.size){rand(0.0..1.0)}
      @output = 0;
      @threshold = 0.5;
    end

    def print_status
      puts "##"
      puts "inputs    = #{@inputs}"
      puts "weights   = #{@weights}"
      puts "threshold = #{@threshold}"
      puts "output    = #{@output}"
    end

    def calculate_output
      @total_input = 0
      @inputs.each_with_index do |input, index|
        @total_input += input * @weights[index]
      end
      @output = @total_input >= @threshold ? 1.0:0
    end
  end
end
