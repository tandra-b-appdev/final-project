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
    @item = Item.new

    render("item_templates/blank_form.html.erb")
  end

  def save_new_info
    @item = Item.new

    @item.essential_flag = params.fetch("essential_flag", false)
    @item.quantity = params.fetch("quantity")
    @item.measurement_units = params.fetch("measurement_units")
    @item.recipe_id = params.fetch("recipe_id")
    @item.ingredient_id = params.fetch("ingredient_id")

    if @item.valid?
      @item.save

      redirect_to("/items", { :notice => "Item created successfully." })
    else
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

      redirect_to("/items/" + @item.id.to_s, { :notice => "Item updated successfully." })
    else
      render("item_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @item = Item.where({ :id => params.fetch("id_to_remove") }).first

    @item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully." })
  end
end
