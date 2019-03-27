class TranslatedInput < SimpleForm::Inputs::Base
  def additional_classes
    super.push('mobility')
  end

  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build

    locales = { main: [], optional: [] }
    I18n.available_locales.each { |l| [:'pt-BR', :en].include?(l) ? locales[:main] << l : locales[:optional] << l }

    locales[:main].each do |locale|
      out << append_locale_input(out, merged_input_options, locale)
    end
    out << template.content_tag(:div, class: 'mobility__expanded') do
      template.concat template.content_tag(:a, '+ See more languages', href: '#', class: 'mobility__expand mobility__expand--open')
      template.concat template.content_tag(:a, '- See less languages', href: '#', class: 'mobility__expand mobility__expand--hide')
      locales[:optional].each do |locale|
        template.concat append_locale_input(out, merged_input_options, locale)
      end
    end

    out
  end

  def append_locale_input(out, merged_input_options, locale)
    out = ActiveSupport::SafeBuffer.new
    
    translated_name = "#{attribute_name}_#{Mobility.normalize_locale(locale)}"
    country = country_for(locale)

    out << template.content_tag(:div, class: 'mobility__locale') do 
      template.concat template.content_tag(:div, template.image_tag('blank.gif', class: "flag flag-#{country}"), class: 'mobility__flag')
      template.concat input_field(translated_name, merged_input_options)
    end

    out
  end

  def input_field(translated_name, merged_input_options)
    @builder.text_field(translated_name, merged_input_options).html_safe
  end

  def country_for(locale)
    case locale 
      when :'pt-BR' then 'br'
      when :en then 'us'
      when :it then 'it'
      when :de then 'de'
      when :es then 'es'
      when :fr then 'fr'
    end
  end
end