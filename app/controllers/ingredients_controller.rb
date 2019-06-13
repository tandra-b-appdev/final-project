class IngredientsController < ApplicationController
  def list
    @ingredients = Ingredient.all

    render("ingredient_templates/list.html.erb")
  end

  def details
    @ingredient = Ingredient.where({ :id => params.fetch("id_to_display") }).first

    render("ingredient_templates/details.html.erb")
  end

  def blank_form
    @ingredient = Ingredient.new

    render("ingredient_templates/blank_form.html.erb")
  end

  def save_new_info
    @ingredient = Ingredient.new

    @ingredient.name = params.fetch("name")
    @ingredient.category_id = params.fetch("category_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients", { :notice => "Ingredient created successfully." })
    else
      render("ingredient_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @ingredient = Ingredient.where({ :id => params.fetch("id_to_prefill") }).first

    render("ingredient_templates/prefilled_form.html.erb")
  end

  def save_edits
    @ingredient = Ingredient.where({ :id => params.fetch("id_to_modify") }).first

    @ingredient.name = params.fetch("name")
    @ingredient.category_id = params.fetch("category_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/" + @ingredient.id.to_s, { :notice => "Ingredient updated successfully." })
    else
      render("ingredient_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @ingredient = Ingredient.where({ :id => params.fetch("id_to_remove") }).first

    @ingredient.destroy

    redirect_to("/ingredients", { :notice => "Ingredient deleted successfully." })
  end
end
