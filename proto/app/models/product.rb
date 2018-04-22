class Product < ApplicationRecord

  has_many :inscontracts

enum products: {
  sampleproduct1:1,
  sampleproduct2:2
}

end
