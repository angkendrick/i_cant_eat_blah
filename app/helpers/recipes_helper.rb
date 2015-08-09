module RecipesHelper

  def get_name(id)
    User.find(id).username
  end

end
