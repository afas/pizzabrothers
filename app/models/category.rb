#encoding: utf-8
class Category
  attr_accessor :name
  attr_accessor :code
  attr_accessor :link

  def self.collection(with_builder)
    list = [
        Category.new(:name => 'Пицца', :code => 1, :link => "/"),
        Category.new(:name => 'Роллы и салаты', :code => 2, :link => "/menu/rolls_and_salads"),
        Category.new(:name => 'Напитки', :code => 3, :link => "/menu/drinks")
    ]
    list += [ Category.new(:name => 'Конструктор пиццы', :code => 10, :link => "/my_pizza") ] if with_builder

    list
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
    self.link = hash[:link]
  end

  def self.by_code(code)
    collection(true).each do |value|
      return value.name if value.code == code
    end
    false
  end

  def self.link_by_code(code)
    collection(true).each do |value|
      return value.link if value.code == code
    end
    false
  end

  def self.code_by_link(link)
    collection(true).each do |value|
      return value.code if value.link == link
    end
    false
  end


end