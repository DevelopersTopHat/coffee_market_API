module Api
    module V1
        class ProductsController < ApplicationController
            # Allows GET request that displays all coffee products as JSON by creation date
            # To hit the endpoint api/v1/products
            def index
                products = Product.order('updated_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded coffee products', data: products}, status: :ok
            end

            # Allows GET request that displays specified coffee product by id as JSON
            # To hit the endpoint api/v1/products/1
            # Note: the value after /products/ can be any id in the product table
            # Also allows GET request that displays all stocked coffee products as JSON
            # To hit the endpoint api/v1/products/in_stock
            def show
                product = Product.find(params[:id]);
                render json: {status: 'SUCCESS', message: 'Loaded coffee product', data: product}, status: :ok
            end

            # Allows POST request that creates a new row in the product table
            # To hit the endpoint api/v1/products setting the header to content-type application/json
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
            # To hit the endpoint api/v1/products/1
            # Note: the value after /products/ can be any id in the product table
            def destroy
                product = Product.find(params[:id])
                product.destroy
                render json: {status: 'SUCCESS', message: 'Deleted coffee product', data: product}, status: :ok          
            end

            # Allows PUT request that updates a row in the product table
            # To hit the endpoint api/v1/products/1 setting the header to content-type application/json
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

            # Attrtibutes needed to do a create/update query
            private def product_params
                params.permit(:title, :price, :inventory_count, :description)
            end

            # Allows GET request that displays all stocked coffee products as JSON by creation date
            # To hit the endpoint api/v1/in_stock
            def in_stock
                products = Product.where('inventory_count > 0').order('updated_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded stocked coffee products', data: products}, status: :ok
            end

            # Allows PUT request that reduces the inventory_count for a row in the product table
            # To hit the endpoint api/v1/purchase/1
            # Note: the value after /products/ can be any id in the product table
            def purchase
                product = Product.find(params[:id])
                
                if (product.inventory_count > 0 && product.update(:inventory_count => product.inventory_count - 1))
                    render json: {status: 'SUCCESS', message: 'Purchased coffee product', data: product}, status: :ok          
                else
                    render json: {status: 'ERROR', message: 'Coffee product purchase failed', data: product.errors}, status: :unprocessable_entity
                end
            end
        end
    end
end