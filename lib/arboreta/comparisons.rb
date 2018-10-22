module Arboreta
  class Comparisons
    def self.gt(left:, right:)
      left > right
    end

    def self.ge(left:, right:)
      left >= right
    end

    def self.lt(left:, right:)
      left < right
    end

    def self.le(left:, right:)
      left <= right
    end

    def self.eq(left:, right:)
      left == right
    end
  end
end
