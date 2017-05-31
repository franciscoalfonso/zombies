class Zombie < ApplicationRecord
    has_many :brains

    validates :name,presence:true
    validates :age, numericality:{ only_integer:true, message:"Sólo números enteros"}
end
