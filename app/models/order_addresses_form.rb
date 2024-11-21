class OrderAddressesForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :address_line, presence: true
  validates :phone_number, presence: true
  validates :token, presence: true
  
  def save
    # 購入情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)

    # 住所情報を保存
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address_line: address_line,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end