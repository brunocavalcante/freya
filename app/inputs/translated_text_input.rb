class TranslatedTextInput < TranslatedInput
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    merged_input_options[:type] = 'text'

    super
  end
end