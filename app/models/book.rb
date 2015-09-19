class Book < ActiveRecord::Base
  has_many :readings, dependent: :destroy
  has_many :users, through: :readings

  def to_param
    handle
  end
end
