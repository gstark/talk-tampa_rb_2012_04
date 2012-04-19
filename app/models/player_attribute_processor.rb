
class PlayerAttributeProcessor
  def initialize(current_user)
    @current_user = current_user
  end

  def self.pre_update_attributes_with_filters(player, params)
    unless @current_user.is_admin?
      params[:player].delete(:sekret_field)
    end
  end
end




