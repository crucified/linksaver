class Content < ActiveRecord::Base
  before_save :empty?
  
  belongs_to :user
  belongs_to :category

  scope :today, where(:created_at => Date.today...Date.tomorrow)
  scope :yesterday, where(:created_at => Date.yesterday...Date.today)
  
  private  
  def empty?
    if title.empty? && link.empty?
      return false
    else
      return true
    end    
  end
end
