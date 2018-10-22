require "arboreta/engine"
require "arboreta/statement"
require "arboreta/comparisons"

module Arboreta
  def self.and(*args)
    args.map(&:execute!).all?
  end

  def self.or(*args)
    args.map(&:execute!).any?
  end

  def self.nothing(*args)
  end
end
