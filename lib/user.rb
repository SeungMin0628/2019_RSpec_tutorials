class User
  def initialize(name:, age:)
    @name = name
    @age = age
  end

  def greet
    if @age > 12
      "僕は#{@name}です。"
    else
      "ぼくは#{@name}だよ。"
    end
  end
end