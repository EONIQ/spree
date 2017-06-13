object @image
attributes *image_attributes
attributes :viewable_type, :viewable_id

@image.attachment.styles.keys.each do |k,v|
  node("#{k}_url") { |i| i.attachment.url(k) }
end if @image
