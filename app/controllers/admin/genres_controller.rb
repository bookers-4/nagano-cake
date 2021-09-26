class Admin::GenresController < ApplicationController
     before_action :authenticate_admin!

 def index
    @genres = Genre.all
    @genre = Genre.new
 end

 def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
      @genres = Genre.all
    end
 end

 def edit
     @genre = Genre.find(params[:id])
 end

 def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    end
 end

 private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end

# paramsはRailsで送られてきた値を受け取るためのメソッドです。
# requireでデータのオブジェクト名(ここでは:list)を指定し、permitでキー（:title,:body）を指定しています。
# これにより、list_paramsの中にフォームで入力されたデータが格納されます。

end
