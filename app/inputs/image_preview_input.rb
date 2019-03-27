class ImagePreviewInput < SimpleForm::Inputs::Base
  def additional_classes
    super.push('single-image-upload')
  end

  def input(wrapper_options = nil)
    # :preview_version is a custom attribute from :input_html hash, so you can pick custom sizes
    version = input_html_options.delete(:preview_version)
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build
    # check if there's an uploaded file (eg: edit mode or form not saved)
    if object.send("#{attribute_name}_attachment")
      # append preview image to output
      out << template.image_tag(object.send(attribute_name), size: 100)
    else
      out << template.content_tag(:div, nil, class: 'single-image-upload__noimg')
    end

    # allow multiple submissions without losing the tmp version
    ##out << @builder.hidden_field("#{attribute_name}_cache").html_safe
    # append file input. it will work accordingly with your simple_form wrappers
    out << @builder.file_field(attribute_name, input_html_options)
  end
end
