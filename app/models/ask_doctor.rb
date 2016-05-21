class AskDoctor < ActiveRecord::Base
	has_many :posts

	def self.search(search)
		where("title LIKE ?", "%#{search}%")
	end
end
