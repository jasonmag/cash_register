class CartPricingService
    def initialize(cart_session)
        @cart = cart_session || {}
        @products = Product.find(@cart.keys)
    end

    def items
        @products.map do |product|
            quantity = @cart[product.id.to_s].to_i
            billed_quantity = calculate_billed_quantity(product,quantity)
            price_per_unit = calculate_price_per_unit(product,quantity)
            total_price = billed_quantity * price_per_unit

            {
                product: product,
                quantity: quantity,
                billed_quantity: billed_quantity,
                price_per_unit: price_per_unit,
                total_price: total_price
            }
        end
    end

    private

    def calculate_billed_quantity(product,quantity)
        return (quantity/2.0).ceil if product.bogo?
        quantity
    end

    def calculate_price_per_unit(product,quantity)
        price = product.price

        if product.bulk_quantity.present? && product.bulk_price.present? && quantity >= product.bulk_quantity
            price = product.bulk_price
        end

        if product.percent_discount.present? && quantity >= 3
            price = price * (1 - product.percent_discount / 100.00)
        end

        price
    end

end