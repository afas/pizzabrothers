#encoding: utf-8
class Sauce
  attr_accessor :name
  attr_accessor :code

  def self.collection
    [
        Sauce.new(:name => 'Классический красный', :code => 1),
        Sauce.new(:name => 'Фирменный белый', :code => 2)
    ]
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
  end

end