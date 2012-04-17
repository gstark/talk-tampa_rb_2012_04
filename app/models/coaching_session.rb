class CoachingSession < ActiveRecord::Base
  belongs_to :coach

  belongs_to :student, :polymorphic => true

  def players
    student.respond_to?(:players) ? student.players : student
    # or student.players if we define class Player; def players; [self]; end
  end
end
