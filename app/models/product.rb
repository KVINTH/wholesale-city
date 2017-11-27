class Product < ApplicationRecord
    belongs_to :category
    has_many :order_items

    #default_scope { where(active: true) }

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def self.search(search)
      where("name ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
    end
end

