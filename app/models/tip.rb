class Tip < ActiveRecord::Base
  validates_presence_of :sport, :country, :league, :teams, :bet, :odds, :game_time, :tip_date, :status

  def self.search(search_query)
    where(:created_at => search_query.beginning_of_day..search_query.end_of_day)
  end

end
