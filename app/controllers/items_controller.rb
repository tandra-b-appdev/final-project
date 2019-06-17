class ItemsController < ApplicationController
  def list
    @items = Item.all

    render("item_templates/list.html.erb")
  end

  def details
    @item = Item.where({ :id => params.fetch("id_to_display") }).first

    render("item_templates/details.html.erb")
  end

  def blank_form
    @recipe_id = params.fetch("recipe_id")
    
    @recipe_name = Recipe.where({:id => @recipe_id}).pluck(:name).first
    
    @item = Item.new
    
    @ingredients = Ingredient.pluck(:name).uniq
    @measurement_units = Item.pluck(:measurement_units).uniq
    
    render("item_templates/blank_form.html.erb")
  end

  def save_new_info
    @item = Item.new
    
    @item.essential_flag = "No"
    @item.essential_flag = "Yes" if params.fetch("essential_flag", false)
    
    @item.quantity = params.fetch("quantity")
    @item.measurement_units = params.fetch("measurement_units")
    
    @item.recipe_id = params.fetch("recipe_id")
    
    existing_ingredient = params.fetch("ingredient")
    new_ingredient = params.fetch("new_ingredient")
    
    if new_ingredient.blank?
      ingredient_name = existing_ingredient
      @item.ingredient_id = Ingredient.where({:name => ingredient_name}).pluck(:id).first
    else  
      ingredient_name = new_ingredient
      @ingredient = Ingredient.new
      @ingredient.name = ingredient_name
      @ingredient.save
      @item.ingredient_id = Ingredient.where({:name => ingredient_name}).pluck(:id).first
      @item.save
      @ingredient.save
    end 
    
    if @item.valid?
      @item.save
      p "ITEM SAVED"

      redirect_to("/recipes/" + @item.recipe_id.to_s, { :notice => "Item created successfully." })
    else
      p @item
      p @item.errors.full_messages
      render("item_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @item = Item.where({ :id => params.fetch("id_to_prefill") }).first

    render("item_templates/prefilled_form.html.erb")
  end

  def save_edits
    @item = Item.where({ :id => params.fetch("id_to_modify") }).first

    @item.essential_flag = params.fetch("essential_flag", false)
    @item.quantity = params.fetch("quantity")
    @item.measurement_units = params.fetch("measurement_units")
    @item.recipe_id = params.fetch("recipe_id")
    @item.ingredient_id = params.fetch("ingredient_id")

    if @item.valid?
      @item.save

      redirect_to("/recipes/" + @recipe_id.to_s, { :notice => "Item updated successfully." })
    else
      # render("item_templates/prefilled_form.html.erb")
      
    end
  end

  def remove_row
    @item = Item.where({ :id => params.fetch("id_to_remove") }).first
    @recipe = Item.where({ :id => params.fetch("id_to_remove") }).pluck(:recipe_id).first
    @item.destroy

    redirect_to("/existing_recipe_form/"+@recipe.to_s, { :notice => "Item deleted successfully." })
  end
end
