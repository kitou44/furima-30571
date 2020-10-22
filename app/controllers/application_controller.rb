class ApplicationController < ActionController::Base
  def index
    @posts = Post.all# 1番目のレコードを@postに代入
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
