class Player < ActiveRecord::Base
  belongs_to :team

  has_one :coach, :through => :team
end

class PlayerWithCallbacks < Player
  after_save { puts "after save" }
end



