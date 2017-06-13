object @image
attributes *image_attributes
attributes :viewable_type, :viewable_id

styles = []
if Spree::Image.attachment_definitions[:attachment][:styles].class == Proc
  styles = Spree::Image.attachment_definitions[:attachment][:styles].call(@image.attachment) if @image
else
  styles = Spree::Image.attachment_definitions[:attachment][:styles]
end

styles.each do |k,v|
  node("#{k}_url") { |i| i.attachment.url(k) }
end
