class House < ActiveRecord::Base
  has_many :persons,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
