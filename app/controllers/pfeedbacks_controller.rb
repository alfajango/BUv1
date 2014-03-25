class PfeedbacksController < ApplicationController
  def create  # where is this called from?
    puts "in project_feedbacks_controller create()"
    @pfb = Pfeedback.new(user_params)   
    #@companies = Company.all
  end
end
