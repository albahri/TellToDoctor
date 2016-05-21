class Profile < ActiveRecord::Base
  belongs_to :user
  
  def self.search(search)
		where("firstname LIKE ?", "%#{search}%")
	end
end
