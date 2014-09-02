#encoding: utf-8
class ProductSize
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        ProductSize.new(:name => '', :code => 0),
        ProductSize.new(:name => 'Стандартная (30см)', :code => 1),
        ProductSize.new(:name => 'Большая (40см)', :code => 2)
    ]

    list
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