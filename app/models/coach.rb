class Coach < ActiveRecord::Base
  has_many :teams
  has_many :coaching_sessions

  has_many :players, :through => :teams

  def all_players
    (players + coaching_sessions.map(&:players).flatten).uniq
  end

  def all_players_via_class
    ComputesAllPlayers.for_coach(self)
  end
end
