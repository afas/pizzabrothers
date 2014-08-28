#encoding: utf-8
class Category
  attr_accessor :name
  attr_accessor :code
  attr_accessor :link

  def self.collection()
    [
        Category.new(:name => 'Пицца', :code => 1, :link => "/"),
        Category.new(:name => 'Роллы и салаты', :code => 2, :link => "/menu/rolls_and_salads"),
        Category.new(:name => 'Напитки', :code => 3, :link => "/menu/drinks")
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
    self.link = hash[:link]
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def self.code_by_link(link)
    collection.each do |value|
      return value.code if value.link == link
    end
    false
  end


end