# controls the post of the project
class Post < ApplicationRecord
	private
	  def preval
	  	if self.title
	  		self.title = self.title.strip
	  	end
	  	if self.content
	  		self.content = self.content.strip

	  	end
	end

	before_validation :preval
	validates_presence_of :title
	validates_presence_of :content 
end

