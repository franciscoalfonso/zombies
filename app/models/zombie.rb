class Zombie < ApplicationRecord
    has_many :brains
    
   
    
    validates :bio, length: { maximum: 100 }
    validates :name, presence: true
    validates :age, numericality: {only_integer: true, message: "Sólo se permiten números enteros"}
    
    
    class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "No es un E-Mail")
    end
  end
end
    validates :email, email: true
    
end
