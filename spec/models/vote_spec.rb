require 'rails_helper'

describe Vote do
	describe "validations" do

		describe "value validation" do
			it "only allows -1 or 1 as values" do
				valid_v = Vote.new(value: 1)
				invalid_v = Vote.new(value: 2)
				expect( valid_v.valid? ).to eq(true)
				expect( invalid_v.valid? ).to eq(false)
			
			end
		end
	end
end