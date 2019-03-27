class SelectAddInput < SimpleForm::Inputs::CollectionSelectInput
  # NOTE: association_name MUST be singular
  def input(wrapper_options)
    link_text = options[:link_text] || "Haven't created yet? Create #{association_name.to_s.titleize}"

    # Append modal with resource form at the end of content div
    @builder.template.render(partial: 'shared/embedded_form',
                             locals: { resource_name: association_name })

    template.content_tag(:div, class: 'select-add') do
      add_link = template.content_tag(:a,
                                      link_text,
                                      href:  '#',
                                      class: 'select-add__toggle', 
                                      data: { target: association_name })
      template.concat super
      template.concat add_link
    end
  end

  def input_html_options
    # Needed to know which select tag to query
    super.deep_merge(data: { selectize: association_name})
  end

  private

  def association_name
    (options[:association_name] || attribute_name).to_s.sub(/_id$/, ''.freeze)
  end
end
