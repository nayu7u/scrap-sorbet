# typed: strict
require "sorbet-runtime"

class Scrap
  extend T::Sig

  sig {params(v: Integer).void}
  def initialize(v)
    @v = v
  end

  sig {returns(Integer)}
  def age
    27
  end

  sig {params(x: Float).returns(String)}
  def float_to_string(x)
    x.to_s
  end

  sig {params(new_value: T::Boolean).void}
  def self.set_flag(new_value)
    @flag = T.let(new_value, T.untyped)
    p 'set'
  end

  set_flag(true)
  set_flag(false)
end

class Simple
  extend T::Sig

  sig {returns(Scrap)}
  def scrap
    Scrap.new(1)
  end
end
end