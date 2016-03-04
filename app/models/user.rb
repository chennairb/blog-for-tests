class User < ActiveRecord::Base
  validates :email, uniqueness: true

  def send_email
    UserMailer.registered(self).deliver!
  end

  def complete_registration
    self.state = 'registered'
    self.save
    send_email
  end

  ## Create Location record, geocode it, and associate it
  def update_locations(country, state, city)
    if !country.blank?

    l = Location.where(city: city, state: state, country: country).last
    l = Location.new(city: city, state: state, country: country)

    if l.latitude.nil? || l.longitude.nil?
      lat, lng = Geocoder.coordinates("#{country}, #{state}, #{city}")
      if lat && lng
        l.latitude = lat
        l.longitude = lng
      end
    end

    l.save!

    # Associate the Location with partner
    ul = UserLocation.where(user_id: self.id, location_id: l.id).last
    if ul.nil?
      ul = UserLocation.new(user_id: self.id, location_id: l.id)
      ul.save!
    end
  end

end
