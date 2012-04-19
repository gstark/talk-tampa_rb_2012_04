class PlayersController

  def update
    player = Player.find(params[:id])

    # ....

    player.update_attributes(params[:player])
  end


  def update
    player = PlayerWithCallbacks.find(params[:id])

    # ....

    player.update_attributes(params[:player])
  end



  def update
    player = Player.find(params[:id])

    # ....

    filters = [PlayerAttributeProcessor.new(current_user),
               PlayerChangingTeamEmailer,
               PlayerJoiningTeamEamiler]

    player.update_attributes_with_filters(filters, params[:player])
  end
end






