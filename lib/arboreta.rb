require "arboreta/engine"

module Arboreta
  def self.and(*args)
    args.all?
  end

  def self.or(*args)
    args.any?
  end

  def self.nothing(*args)
  end
end
