#encoding: utf-8
class ProductSize
  attr_accessor :name
  attr_accessor :code
  attr_accessor :short_name
  attr_accessor :price

  def self.collection(pizza_only)
    list = []

    unless pizza_only
      list += [ProductSize.new(:name => '', :code => 0)]
    end

    list += [
        ProductSize.new(:name => 'Стандартная (30см)', :code => 1, :short_name => "classic", :price => 130),
        ProductSize.new(:name => 'Большая (45см)', :code => 2, :short_name => "big", :price => 150)
    ]

    list
  end

  def self.by_code(code)
    collection(false).each do |value|
      return value.name if value.code == code
    end
  end

  def self.short_name_by_code(code)
    collection(false).each do |value|
      return value.short_name if value.code == code
    end
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
    self.short_name = hash[:short_name]
    self.price = hash[:price]
  end

end