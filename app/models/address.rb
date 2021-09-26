class Address < ApplicationRecord
    belongs_to :customer
    # 会員

    def address_all
        self.postal_code + self.address + self.first_name + self.last_name
    end

end
