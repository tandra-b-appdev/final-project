class RecipesController < ApplicationController
  def list
    @recipes = Recipe.all

    render("recipe_templates/list.html.erb")
  end

  def details
    @recipe = Recipe.where({ :id => params.fetch("id_to_display") }).first

    render("recipe_templates/details.html.erb")
  end

  def blank_form
    @recipe = Recipe.new

    render("recipe_templates/blank_form.html.erb")
  end

  def save_new_info
    @recipe = Recipe.new

    @recipe.source_website = params.fetch("source_website")
    @recipe.name = params.fetch("name")
    @recipe.user_id = params.fetch("user_id")

    if @recipe.valid?
      @recipe.save

      redirect_to("/recipes", { :notice => "Recipe created successfully." })
    else
      render("recipe_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @recipe = Recipe.where({ :id => params.fetch("id_to_prefill") }).first

    render("recipe_templates/prefilled_form.html.erb")
  end

  def save_edits
    @recipe = Recipe.where({ :id => params.fetch("id_to_modify") }).first

    @recipe.source_website = params.fetch("source_website")
    @recipe.name = params.fetch("name")
    @recipe.image = params.fetch("image")

    if @recipe.valid?
      @recipe.save

      redirect_to("/recipes/" + @recipe.id.to_s, { :notice => "Recipe updated successfully." })
    else
      render("recipe_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @recipe = Recipe.where({ :id => params.fetch("id_to_remove") }).first

    @recipe.destroy

    redirect_to("/recipes", { :notice => "Recipe deleted successfully." })
  end
end
