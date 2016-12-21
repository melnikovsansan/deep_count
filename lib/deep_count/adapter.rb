module DeepCount
  class Adapter
    attr_reader :input, :output

    def initialize(input)
      @input = input
      @output = {}
    end

    def call
      if input.is_a?(Hash) && input.keys.first.is_a?(Array)
        prepare_output
        output
      else
        input
      end
    end

    def prepare_output
      input.each { |arr, value| add_to output, arr, value }
    end

    def add_to(object, array, value)
      key = array.shift
      if array.any?
        add_to object[key] ||= {}, array, value
      else
        object[key] = value
      end
    end
  end
end