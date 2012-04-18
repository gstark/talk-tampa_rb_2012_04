require_relative '../../app/models/computes_all_players'

describe ComputesAllPlayers do
  it "#all_players returns players associated to teams and to coaching sessions" do
    # Create some players and coach
    player_1 = stub(:player)
    player_2 = stub(:player)
    player_3 = stub(:player)

    # Create two different teams each with a player
    team_1  = stub(:team, :players => [player_1])
    team_2  = stub(:team, :players => [player_2])

    # Create two different coaching sessions
    # one for a player not on the coach's team
    # one for a team not belonging to the coach
    coaching_session_1 = stub(:coaching_session, :players => [player_3])
    coaching_session_2 = stub(:coaching_session, :players => team_2.players)

    # Create the coach with a team of players
    # and the coaching sessions above
    coach = stub(:coach, :players           => team_1.players,
                         :coaching_sessions => [coaching_session_1, coaching_session_2])

    # player_1 via the coach's team, player 2 via a coaching session team
    # and player 3 via a coaching session for the single player
    ComputesAllPlayers.for_coach(coach).should =~ [player_1, player_2, player_3]
  end
end
