class Equipment < ApplicationRecord
  belongs_to :flat
end

# has_many: qqchose
# has_many: autre_chose, through: :qqchose
