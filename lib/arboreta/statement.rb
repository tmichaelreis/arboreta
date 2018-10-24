module Arboreta
  class Statement
    attr_accessor :comparison, :subject, :left_method, :right_method

    def initialize(args)
      @comparison = args['comparison']
      @subject = args['subject']
      @left_method = args['left_method']
      @right_method = args['right_method']
    end

    def execute!
      Arboreta::Comparisons.send(comparison, {left: left, right: right})
    end

    def left
      subject.arboreta_send(left_method)
    end

    def right
      subject.arboreta_send(right_method)
    end

  end
end
