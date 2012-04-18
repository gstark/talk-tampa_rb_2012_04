require 'spec_helper'

describe Coach do
  it "#all_players returns players associated to teams and to coaching sessions" do
    coach_1 = FactoryGirl.create(:coach)
    coach_2 = FactoryGirl.create(:coach)

    team_1  = FactoryGirl.create(:team, :coach => coach_1)
    team_2  = FactoryGirl.create(:team, :coach => coach_2)

    player_1 = FactoryGirl.create(:player, :team => team_1)
    player_2 = FactoryGirl.create(:player, :team => team_2)

    FactoryGirl.create(:coaching_session, :student => player_1, :coach => coach_1)
    FactoryGirl.create(:coaching_session, :student => team_2,   :coach => coach_1)

    coach_1.all_players.should =~ [player_1, player_2]
  end
end
