#encoding: utf-8
class Ingridient
  attr_accessor :code
  attr_accessor :name
  attr_accessor :price
  attr_accessor :image

  def self.collection
    list = [
        Ingridient.new(code: 0, name: 'Курица', image: 'chiken.png'),
        Ingridient.new(code: 1, name: 'Свинина', image: 'pork.png'),
        Ingridient.new(code: 2, name: 'Бекон', image: 'bacon.png'),
        Ingridient.new(code: 3, name: 'Ветчина', image: 'ham.png'),
        Ingridient.new(code: 4, name: 'Колбаса (пепперони)', image: 'pepperoni.png'),
        Ingridient.new(code: 5, name: 'Колбаса (сырокопченая полукопченая)', image: 'sausages_classic.png'),
        Ingridient.new(code: 6, name: 'Охотничьи колб', image: 'sausages_hunting.png'),
        Ingridient.new(code: 7, name: 'Сосиски', image: 'sausages.png'),
        Ingridient.new(code: 8, name: 'Семга', image: 'salmon.png'),
        Ingridient.new(code: 9, name: 'Креветки', image: 'shrimp.png'),
        Ingridient.new(code: 10, name: 'Мидии', image: 'mussels.png'),
        Ingridient.new(code: 11, name: 'Томаты', image: 'tomatoes.png'),
        Ingridient.new(code: 12, name: 'Перец болг', image: 'sweet_pepper.png'),
        Ingridient.new(code: 13, name: 'Шампиньоны', image: 'mushrooms.png'),
        Ingridient.new(code: 14, name: 'Корнишоны', image: 'gherkins.png'),
        Ingridient.new(code: 15, name: 'Брокколи', image: 'broccoli.png'),
        Ingridient.new(code: 16, name: 'Ананасы', image: 'pineapples.png'),
        Ingridient.new(code: 17, name: 'Маслины', image: 'olives.png'),
        Ingridient.new(code: 18, name: 'Зелень', image: 'green.png'),
        Ingridient.new(code: 19, name: 'Моцарелла', image: 'mozarella.png'),
        Ingridient.new(code: 20, name: 'Пармезан', image: 'parmezan.png'),
        Ingridient.new(code: 21, name: 'Дорблю', image: 'dorblu.png')
    ]
    list
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def initialize(hash)
    self.code = hash[:code]
    self.name = hash[:name]
    self.image = "/assets/ingridient/" + hash[:image]
  end

end