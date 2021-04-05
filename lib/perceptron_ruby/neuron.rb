module PerceptronRuby

  require "perceptron_ruby/activation_func"

  class Neuron
    attr_writer :inputs
    attr_reader :output

    def initialize(input_neurons = 2)
      @inputs = Array.new(input_neurons)
      @weights = Array.new(input_neurons){rand(0.0..1.0)}
      @output = nil;
    end

    def print_status
      puts "##"
      puts "inputs    = #{@inputs}"
      puts "weights   = #{@weights}"
      puts "output    = #{@output}"
      return self
    end

    def calculate_output
      @total_input = 0
      @inputs.each_with_index do |input, index|
        @total_input += input * @weights[index]
      end
      @output = ActivationFunc.sigmoid(@total_input)
    end

    def update_weights(delta = [])
      return false unless @weights.length == delta.length
      return false if delta.index do |d|
        !d.is_a?(Numeric)
      end
      @weights = @weights.map.with_index do |w,i|
        w += delta[i]
      end
    end
  end
end
