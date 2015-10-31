class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
          validates :shop_name, presence: true
          validates :shop_add, presence: true
          validates :shop_detail, presence: true
          geocoded_by :shop_add
					after_validation :geocode, :if => :shop_add_changed?
end
