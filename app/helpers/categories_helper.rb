module CategoriesHelper
  def category_select(category, branch)
    if category
      category.name
    else
      select_tag "branch[category_id]", options_from_collection_for_select(Category.all, :id, :name)
    end
  end
end
