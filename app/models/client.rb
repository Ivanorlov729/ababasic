class Client
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  field :first_name,              type: String, default: ""
  field :last_name,         		  type: String, default: ""
  field :birthday,                type: Date,   default: ""
  field :diagnosis,               type: String, default: ""
  field :school,                  type: String, default: ""
  field :photo,                   type: String, default: ""

  def photo_url
  	if self.photo.url.nil?
  		""
  	else
      # if Rails.env.production?
      #   self.photo.url
      # else
    		self.photo.url.gsub("#{Rails.root.to_s}/public/album/", "/public/album/")
      # end
  	end
  end

  def info_by_json
    {id: self.id.to_s, first_name: self.first_name, last_name: self.last_name, birthday: self.birthday, diagnosis: self.diagnosis, school: self.school, photo: self.photo_url}
  end
end
