# typed: strict

require "sorbet-runtime"

x = T.let(nil, T.nilable(Integer))
p x
(0..10).each do |n|
  x = n if n % 3 == 0
end

# 定数に注釈
NAMES = T.let(["Taro", "Jiro"], T::Array[String])

# クラス変数・インスタンス変数の初期値の型付け
class Hoge
  extend T::Sig
  @@bar = T.let([], T::Array[String])

  sig { void }
  def initialize
    @foo = T.let(0, Integer)
  end
end

# 遅延評価にも対応
module B
  extend T::Sig
  
  sig {returns(String)}
  def user
    @user ||= T.let(ENV.fetch("USER"), T.nilable(String))
  end
end

class A
  extend T::Sig

  sig {params(x: T::Array[Integer]).returns(Integer)}
  def f(x)
    # T.reveal_type は be srb tc したときに引数の型情報を教えてくれる
    T.reveal_type(x.first)
  end
end

# @yのようなケースはT.letなしに型推論ができない
class Foo
  sig {params(x: Integer, y: Integer).void}
  def initialize(x, y)
    @x = x
    @y = y + 0

    T.reveal_type(@x)  # Integer
    T.reveal_type(@y)  # T.untyped
  end
end