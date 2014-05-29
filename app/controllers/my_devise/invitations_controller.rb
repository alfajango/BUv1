# from http://howilearnedrails.wordpress.com/2013/12/27/how-to-override-and-customize-the-devise-controller-in-rails/comment-page-1/
class MyDevise::InvitationsController < Devise::InvitationsController
	def create
		# puts "in users InvitationsController create before super"
		super # this calls Devise::InvitationsController#create ??
		# puts "self.resource: #{self.resource}"  # that's the user object that I'm looking for!!
		# puts "self.resource.name: #{self.resource.name}"
		# puts "self.resource.email: #{self.resource.email}"
		inv_par = invite_params
		new_user = self.resource

		# puts "inv_par: #{inv_par}"
		# puts "inv_par[:company_id] #{inv_par[:company_id]}"
		# puts "&block: #{&block}"
		# puts "in users InvitationsController create after super"
        co = Company.find(inv_par[:company_id])   # this needs work and error checking

        # this is only sort of working
	    co.users << new_user
	    #new_user.company_id = inv_par[:company_id]
	    new_user.save!  # need pwd check turned off to do this.
	    # puts "new_user.company: #{new_user.company}"
	    # puts "new_user.company.name: #{new_user.company.name}"
	    # puts "new_user.name: #{new_user.name}"
	    company_users = current_user.company.users
	    # company_users.each do |usr|
	    # 	puts "#{usr.name}"
	    # end
	    # puts "current_user.company.users: #{current_user.company.users}"
	    # puts "done Users InvitationsController"
	end
end

