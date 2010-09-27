module SectionHelpers
  def xpath_of_section(section_name, prefix = "//")
    case section_name

    when 'the main navigation'
      "#{prefix}*[contains(@class, 'main_nav')]"      
    else
      raise "Can't find mapping from \"#{section_name}\" to a section."
    end
  end
end

World(SectionHelpers)
