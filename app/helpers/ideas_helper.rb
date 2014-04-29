module IdeasHelper

  def set_idea(params)
    idea = Idea.find_by(id: params[:id])  # return idea is implied
  end

end
