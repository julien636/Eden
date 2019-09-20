class Product < ApplicationRecord
    has_many :offers

    def self.vegetable_prod
        category = self.where(prod_category: "VEGETABLE")
        return category
    end

    def self.legume_prod
        category = self.where(prod_category: "LEGUME")
        return category
    end

    def self.cereal_prod
        category = self.where(prod_category: "CEREAL")
        return category
    end

    def self.fruit_prod
        category = self.where(prod_category: "FRUIT")
        return category
    end


end
