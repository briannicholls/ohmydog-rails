module ApplicationHelper
  def edit_button(model)
    name = model.class.to_s
    link_to("Edit #{name}", send("edit_#{name.downcase}_path", model), class: 'w3-button w3-bar w3-yellow')
  end
end
