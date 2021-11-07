class TodolistsController < ApplicationController
  
  def new
    # viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    # 1データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３トップ画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end


  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
 
end