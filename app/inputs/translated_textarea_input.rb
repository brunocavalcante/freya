class TranslatedTextareaInput < TranslatedInput
  def input_field(translated_name, merged_input_options)
    merged_input_options[:as] = :text
    @builder.input_field(translated_name, merged_input_options).html_safe
  end
end