require 'rails_helper'

RSpec.describe Goal, type: :model do
   it { should validate_presence_of(:total_steps) }
   it { should validate_presence_of(:total_calories_burned) }
   it { should validate_presence_of(:total_calories) }
   it { should validate_presence_of(:total_protein) }
   it { should validate_presence_of(:total_carbohydrates) }
   it { should validate_presence_of(:total_fat) }
end
