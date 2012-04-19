module GavinsCrazyFilterIdea

  def update_attributes_with_filters(filters, params)
    filters.each do |filter|
      filter.pre_update_attributes(self, params)
    end

    self.update_attributes(params)

    filters.each do |filter|
      filter.post_update_attributes(self, params)
    end
  end
end

ActiveRecord::Base.send(:include, GavinsCrazyFilterIdea)






