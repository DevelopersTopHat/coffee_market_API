module Api
    module V1
        class ProductsController < ApplicationController
            def index
                products = Product.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded coffee products', data: products}, status: :ok
            end

            def show
                product = Product.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded coffee product', data: product}, status: :ok
            end

            def create
                product = Product.new(product_params)

                if (product.save)
                    render json: {status: 'SUCCESS', message: 'Saved new coffee product', data: product}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'New coffee product not saved', data: product.errors}, status: :unprocessable_entity
                end
            end
            private 
                def product_params
                    params.permit(:title, :price, :inventory_count, :description)
                end
        end
    end
end