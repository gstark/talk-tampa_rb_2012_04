class Player < ActiveRecord::Base
end

module PlayerChangingTeamEmailer
  class Filter
    def after_save(player)
      puts "Call mailer here..."
    end
  end

  def self.extended(player)
    class << player
      after_save Filter.new
    end
  end
end

class PlayersController
  def update
    player = Player.find(params[:id])
    player.extend(PlayerChangingTeamEmailer)
    player.update_attributes(params[:player])
  end
end



