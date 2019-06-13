Rails.application.routes.draw do
  devise_for :users
  # Routes for the Item resource:

  # CREATE
  match("/new_item_form", { :controller => "items", :action => "blank_form", :via => "get" })
  match("/insert_item_record", { :controller => "items", :action => "save_new_info", :via => "post" })

  # READ
  match("/items", { :controller => "items", :action => "list", :via => "get" })
  match("/items/:id_to_display", { :controller => "items", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_item_form/:id_to_prefill", { :controller => "items", :action => "prefilled_form", :via => "get" })
  match("/update_item_record/:id_to_modify", { :controller => "items", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_item/:id_to_remove", { :controller => "items", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  match("/new_category_form", { :controller => "categories", :action => "blank_form", :via => "get" })
  match("/insert_category_record", { :controller => "categories", :action => "save_new_info", :via => "post" })

  # READ
  match("/categories", { :controller => "categories", :action => "list", :via => "get" })
  match("/categories/:id_to_display", { :controller => "categories", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_category_form/:id_to_prefill", { :controller => "categories", :action => "prefilled_form", :via => "get" })
  match("/update_category_record/:id_to_modify", { :controller => "categories", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_category/:id_to_remove", { :controller => "categories", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  match("/new_ingredient_form", { :controller => "ingredients", :action => "blank_form", :via => "get" })
  match("/insert_ingredient_record", { :controller => "ingredients", :action => "save_new_info", :via => "post" })

  # READ
  match("/ingredients", { :controller => "ingredients", :action => "list", :via => "get" })
  match("/ingredients/:id_to_display", { :controller => "ingredients", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_ingredient_form/:id_to_prefill", { :controller => "ingredients", :action => "prefilled_form", :via => "get" })
  match("/update_ingredient_record/:id_to_modify", { :controller => "ingredients", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  match("/new_recipe_form", { :controller => "recipes", :action => "blank_form", :via => "get" })
  match("/insert_recipe_record", { :controller => "recipes", :action => "save_new_info", :via => "post" })

  # READ
  match("/recipes", { :controller => "recipes", :action => "list", :via => "get" })
  match("/recipes/:id_to_display", { :controller => "recipes", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_recipe_form/:id_to_prefill", { :controller => "recipes", :action => "prefilled_form", :via => "get" })
  match("/update_recipe_record/:id_to_modify", { :controller => "recipes", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
