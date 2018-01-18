module Spree
  module Admin
    class ProductPropertiesController < ResourceController
      # belongs_to 'spree/product', :find_by => :slug
      before_action :load_data

      before_action :find_properties
      before_action :setup_property, only: :index

      private
        def load_data
          @product = Spree::Product.friendly.find(params[:product_id])
        end

        def find_properties
          @properties = Spree::Property.pluck(:name)
        end

        def setup_property
          @product.product_properties.build
        end
    end
  end
end
