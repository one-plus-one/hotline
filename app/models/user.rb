class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :blank => false
  validates_uniqueness_of :username
  has_many :work_orders

  def self.add_column_names(sheet1, index, flag)
    sheet1[0, index]= flag ? '创建人姓名' : '修改人姓名'
  end

  def self.add_column_value(sheet1, index_x, index_y, id)
    user = User.find(id)
    if user!=nil
      sheet1[index_x, index_y]=user['username']
    end
  end
end
