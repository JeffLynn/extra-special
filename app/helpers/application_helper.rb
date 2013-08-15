# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def mandatory_indicator
    "<span class=\"mandatory\">*</span>".html_safe
  end

  def actual_page?(page_name)
    return page_name if params['action'] == page_name

    'inactive'
  end
end

