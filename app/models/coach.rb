class Coach < ActiveRecord::Base
  belongs_to :team

  has_many :players, :through => :team
end
