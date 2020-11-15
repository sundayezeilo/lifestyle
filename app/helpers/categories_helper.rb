module CategoriesHelper
  def fetch_cat_id(cat_name)
    @categories.find_by(name: cat_name).id if @categories
  end
end
