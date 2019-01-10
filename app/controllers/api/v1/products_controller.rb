module Api
    module V1
        class ProductsController < ApplicationController
            # Allows GET request that displays all coffee products as JSON by creation date
            # To query hit the endpoint /v1/products
            def index
                products = Product.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded coffee products', data: products}, status: :ok
            end

            # Allows GET request that displays specified coffee product by id as JSON
            # To query hit the endpoint /v1/products/1
            # Note: the value after /products/ can be any id in the product table
            def show
                product = Product.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded coffee product', data: product}, status: :ok
            end

            # Allows POST request that creates a new row in the product table
            # To query hit the endpoint /v1/products setting the header to content-type application/json
            # Note: all the product parameters are mandatory, (title, price, inventory_count, description)
            def create
                product = Product.new(product_params)

                if (product.save)
                    render json: {status: 'SUCCESS', message: 'Saved new coffee product', data: product}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'New coffee product not saved', data: product.errors}, status: :unprocessable_entity
                end
            end
            
            # Allows DELETE request that removes a row by id in the product table
            # To query hit the endpoint /v1/products/1
            # Note: the value after /products/ can be any id in the product table
            def destroy
                product = Product.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Deleted coffee product', data: product}, status: :ok          
            end

            # Allows PUT request that updates a row in the product table
            # To query hit the endpoint /v1/products/1 setting the header to content-type application/json
            # Note: all the product parameters are mandatory, (title, price, inventory_count, description)
            # Note: the value after /products/ can be any id in the product table
            def update
                product = Product.find(params[:id])
                
                if (product.update_attributes(product_params))
                    render json: {status: 'SUCCESS', message: 'Updated coffee product', data: product}, status: :ok          
                else
                    render json: {status: 'ERROR', message: 'Coffee product not updated', data: product.errors}, status: :unprocessable_entity
                end
            end

            private def product_params
                params.permit(:title, :price, :inventory_count, :description)
            end
        end
    end
end