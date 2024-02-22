class Attendee
  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  def has_pass?
    @pass_id
  end

  def fits_ride?(ride_minimum_height)
    @height >= ride_minimum_height
  end

  def allowed_to_ride?(ride_minimum_height)
    fits_ride?(ride_minimum_height) and has_pass?
  end
end
