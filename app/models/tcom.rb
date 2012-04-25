class Tcom < ActiveRecord::Base
  #before_save :youtube_shorten

  #Associations
  belongs_to :user
  belongs_to :business_type
  
  # The below two relationships are used to store naics and classification details with has_many relationships.
  has_many :company_naics, :dependent => :destroy
  accepts_nested_attributes_for :company_naics, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  has_many :company_classifications, :dependent => :destroy
  accepts_nested_attributes_for :company_classifications, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :company_name, :website, :business_email, :business_phone, :address, :city, :zipcode, :no_of_employee, :business_start_date, :contract_experience, :product_and_service, :business_structure, :business_type_id
  validates_uniqueness_of :business_email
  validates_numericality_of :business_phone, :alternative_phone, :no_of_employee, :zipcode
  validates :company_name, :length => {:in=>4..25}
  validates :title, :length => {:in=>4..25}
  validates :address , :length => {:in=>20..200}
  
  #select all the business types from BusinessType Table.
  def self.business_type_select
    BusinessType.all.collect { |c| [c.business_type, c.id]}
  end
  
  private
  # Shorten youtube video HTTP link, strip iframe tags and leave only video ID.
  def youtube_shorten
    if self.youtube_video
      self.youtube_video = self.youtube_video.sub(/^.*http:\/\/www.youtube.com\/\w+\/([^ ]+).*$/, '\1')
    end
  end
  
end
