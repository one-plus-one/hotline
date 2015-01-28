class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :blank => false
  validates_uniqueness_of :username
  has_many :work_orders

  def self.add_column_names(sheet1, index)
      sheet1[0,index]='user_name'
  end

  def self.add_column_value(sheet1,index_x,index_y, id)
    user = User.find(id)
    sheet1[index_x,index_y]=user['username']
  end
end
