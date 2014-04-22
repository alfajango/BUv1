module ProjectsHelper
  def set_project(params)
   project = Project.find_by(id: params[:id])  # return project is implied
   end
end
