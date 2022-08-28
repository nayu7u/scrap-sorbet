# typed: strict
require "sorbet-runtime"

class Scrap
  extend T::Sig

  sig {params(v: Integer).returns(Scrap)}
  def initialize(v)
    @v = v
  end
end