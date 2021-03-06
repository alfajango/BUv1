# from http://howilearnedrails.wordpress.com/2013/12/27/how-to-override-and-customize-the-devise-controller-in-rails/comment-page-1/
class MyDevise::RegistrationsController < Devise::RegistrationsController
	def create
		puts "in mydevise create before super"
		super # this calls Devise::RegistrationsController#create

		# puts "in mydevise create after super"
		if current_user  # prevents an error if submit a blanksign up page
		    # puts "current_user.name: #{current_user.name}" #causes error when creating new company
    
	        #@user = User.new(user_params)   
	        @companies = Company.all
	    
	    	domain = current_user.email.split("@").last 
	    	# puts "domain is #{domain}"
	    	name = domain.split(".com").first.capitalize
		    if @companies.where(domain: domain).exists?  
		      # puts " this company already exists"
		      co = @companies.where(domain: domain).first # not sure why I need first ??
		      # puts "co.name: #{co.name}"
		    else 
		      # puts " first user in this company "
		      co = Company.create!(domain: domain, name: name)  
	 		  # puts "in forming new company, co= #{co}"

	 		  #also create 2 baseline projects for this company:
	 		  proj1 = Project.create!(name: "Make our customers happy")
			  co.projects << proj1
			  proj2 = Project.create!(name: "Keep employees motivated and engaged")
			  co.projects << proj2		  
		    end 
		    co.users << current_user
		    # puts "done mydevise#create"
		end

	end
end

