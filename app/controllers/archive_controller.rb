class ArchiveController < ApplicationController
  def best_like
    @posts = Post.all
    @best_post = Post.find(total_best)
  end

  private

  def total_best
    Favorite.group(:post_id).order("count_all desc").count.first.first
  end

  # def monthly_bests
  #   thisMonth = Date.today.month
  #   thisYear = Date.today.year
  #   num = 1
  #   # からの配列作成
  #   monthly_posts = []
  #   # 先月から過去3か月分の月間人気記事のIDを月ごとに取得して配列に追加
  #   while num <= 3 do
  #     target_month = thisMonth - num
  #     target_year = thisYear
  #     case target_month
  #     when 0 then
  #       target_month = 12
  #       target_year = thisYear - 1
  #     when -1 then
  #       target_month = 11
  #       target_year = thisYear - 1
  #     when -2 then
  #       target_month = 10
  #       target_year = thisYear - 1
  #     end
  #     monthly_post = Favorite.by_year(target_year).by_month(target_month).group(:post_id).order("count_all desc").count.first.first
  #     monthly_posts.push(monthly_post)
  #     num = num + 1
  #   end
  #   # 配列を戻り値として返す
  #   return monthly_posts
  # end
end
