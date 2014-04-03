class PfeedbacksController < ApplicationController
	puts "in pfeedbacks_controller"
  def create  # where is this called from?
    puts "in pfeedbacks_controller create"
    @pfb = Pfeedback.new(pfeedback_params)   
    puts "pfeedback_params: #{pfeedback_params}"
    #@companies = Company.all
  end

	def pslider_complete
		puts "in pslider_complete"
		#puts "params[:id]: #{params[:id]}"
		#puts "params: #{params}"
		#puts "comScore: #{params[:comScore]}"

		#@attribute=Attribute.all
		#@user = User.find(params[:id])
		puts "params: #{params}"
		project = Project.find_by(id: params[:id])
		puts "project.name: #{project.name}"
		if params[:executionScore].to_i > 0
		  puts "in pslider_complete if executionValue"
		  pfb = Pfeedback.create(attribute: "Execution", from_id: current_user.id,  
		                    rating_given: params[:ExecutionScore]);
		  project.pfeedbacks << pfb
		end
		if params[:strategyScore].to_i > 0
		  pfb = Pfeedback.create(attribute: "Strategy", from_id: current_user.id,  
		                    rating_given: params[:StratScore]);
		  project.pfeedbacks << pfb
		end


		flash[:success] = "Thanks for the feedback!"
		redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
	end

end
