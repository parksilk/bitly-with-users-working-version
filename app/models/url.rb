class Url < ActiveRecord::Base
  belongs_to :user
  
  validates :url, :presence => true
  before_create :add_key
  validates :url, :format => { :with => /^(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)$/,
            :message => "is not a valid url."}

  private
    def add_key
      self.key = SecureRandom.urlsafe_base64(3, false)
    end
end


