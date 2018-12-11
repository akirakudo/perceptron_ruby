module PerceptronRuby
  class ActivationFunc
    def self.sigmoid(x)
      1 / (1 + Math.exp(-x))
    end
  end
end
