module Spree
	class Calculator::FlexiRate < Calculator
		preference :item_rates, :hash, :default => {"" => ""}

		attr_accessible :preferred_item_rates
		
		before_save :prepare_values
		
    def self.description
      I18n.t('flexirate_extended.description')
    end

    def self.available?(object)
      true
    end
		
		def custom_template
			'spree/admin/calculator/flexirate/calculator_fields'
		end
		
		
		def compute(object)
			shipping_cost = 0
			items_count = object.line_items.map(&:quantity).sum

			items_cost = eval self.preferred_item_rates
			last_item = false
			jump_to_next_rate = false # Mark the rate to be increased to the next level if the item count is in a range more than 1 (ie: between 7 - 12)

			items_cost.each_with_index do |(items, cost), index|
				last_item = true if index == items_cost.length - 1
				if !last_item && (items_count >= items || jump_to_next_rate == true)
					shipping_cost = cost
					if items_count > items
						jump_to_next_rate = true
					else
						jump_to_next_rate = false
					end
				elsif last_item && items_count >= items
				 	shipping_cost = cost
				end
			end

			shipping_cost
		end
		
		protected

		def prepare_values
			refined_item_rates = Hash.new

			i = 1
			while !preferred_item_rates.empty? && i <= (preferred_item_rates.length)/2
				key_key = "key_" + i.to_s
				value_key = "value_" + i.to_s
			
				key = 	preferred_item_rates[key_key].to_i
				value = preferred_item_rates[value_key].to_f
			
				refined_item_rates[key] = value
			
				i += 1
			end

			# Tries to fix the human error by matching the key <= 0. The value shouldn't be matched
			#  since it may remove the ability to offer free shipping above certain amount of items
			refined_item_rates.delete_if {|key, value| key <= 0 }
			
			# Sorts the hash by keys
			refined_item_rates = Hash[refined_item_rates.sort]
			
			# Converted to a string and made sure it's html safe
			self.preferred_item_rates = refined_item_rates.to_s.html_safe
		end
		
  end
end
