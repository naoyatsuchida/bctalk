class Image < ApplicationRecord
  belongs_to :post
  belongs_to :message

end
