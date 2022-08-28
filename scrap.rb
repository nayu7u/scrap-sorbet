# typed: strict
require "sorbet-runtime"

class Scrap
  extend T::Sig

  sig {params(v: Integer).void}
  def initialize(v)
    @v = v
  end
end