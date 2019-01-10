module Api
    module v1
        class ProductController < ApplicationController
            def index
                products = Product.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded coffee products', data: products}, status: ok
            end
        end
    end
end