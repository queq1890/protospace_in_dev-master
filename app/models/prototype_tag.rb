class PrototypeTag < ActiveRecord::Base
  belongs_to :Prototype
  belongs_to :tag
end
