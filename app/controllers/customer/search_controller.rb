class Customer::SearchController < ApplicationController
  
  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how,@value)
  end
  
  private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Item.where(name: value)
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Item.where("name LIKE ?", "#{value}%")        
  end

  def backward(value)
    Item.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Item.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how
    when 'match'                 
      match(value)              #引数のhowと一致する処理に進むように定義しています。
    when 'genre'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      genre(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
  
end