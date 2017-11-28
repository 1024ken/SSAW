class All_ranking < ApplicationRecord
  def all_ranking
    all_ranking = Season.all.collect do |season|
      season.likes.count
    end

    self_likes_count = self.likes.count

    high_rank_seasons = ranking.keep_if do |likes_count|
      likes_count > self_likes_count
    end

    return high_rank_seasons.count + 1
  end

  def self.all_ranking
    all_ranking = Season.all.sort_by do |season|
      season.rank
    end

    all_ranking = all_ranking.keep_if do |season|
      season.rank <= 5
    end

    return all_ranking
  end
end
