class AttributesController < ApplicationController
	def index
		puts "in AttributesController index"
		@attributes = Attribute.all
	end

	def new  # don't think this is needed/ used
		puts "in AttributesController new"
		redirect_to :back
	end
end
