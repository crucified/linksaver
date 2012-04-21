class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  scope :today, where(:created_at => Date.today...Date.tomorrow)
end
