class AttributesController < ApplicationController
	def index
		puts "in AttributesController index"
		@attributes = Attribute.all
	end
end
