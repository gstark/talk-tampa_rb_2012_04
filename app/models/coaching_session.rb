class CoachingSession < ActiveRecord::Base
  belongs_to :coach

  belongs_to :student, :polymorphic => true
end
