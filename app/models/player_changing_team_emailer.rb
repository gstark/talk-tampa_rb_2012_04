
class PlayerChangingTeamEmailer
  def self.post_update_attributes_with_filters(player, params)
    if player.team_id_changed?
      PlayerMailer.changing_team(player).deliver
      # Or submit to a background worker queue...
    end
  end
end



