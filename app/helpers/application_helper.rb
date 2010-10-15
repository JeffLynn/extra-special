# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def mandatory_indicator
    "<span class=\"mandatory\">*</span>"
  end

  def actual_page?(page_name)
    return 'active' if params['action'] == page_name

    'inactive'
  end
end
