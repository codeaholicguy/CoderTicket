class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  
  has_many :ticket_types

  validates :ticket_types, :length => { :minimum => 1 }

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  accepts_nested_attributes_for :ticket_types, allow_destroy: true
  accepts_nested_attributes_for :venue

end
