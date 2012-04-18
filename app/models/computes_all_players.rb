class ComputesAllPlayers
  def self.for_coach(coach)
    (coach.players + coach.coaching_sessions.map(&:players).flatten).uniq
  end
end
