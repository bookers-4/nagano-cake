class Adimin::GenresController < ApplicationController

 def index
    @genres = Genre.all
    @genre = Genre.new
 end

 def create
     genre = Genre.new(genre_params)
     genre.save
     redirect_to admin_genres_pash
 end

 def edit
  @genre = Genre.find(params[:id])
 end

 def update
  genre = Genre.find(params[:id])
  genre.update(list_params)
  redirect_to admin_genres_pash
 end

 private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:title, :body)
  end
  
# paramsはRailsで送られてきた値を受け取るためのメソッドです。
# requireでデータのオブジェクト名(ここでは:list)を指定し、permitでキー（:title,:body）を指定しています。
# これにより、list_paramsの中にフォームで入力されたデータが格納されます。

end
