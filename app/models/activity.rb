class Activity

  def initialize(user, day)
    @_user = user
    @_day = day
  end

  def self.service
    @service ||= ActivityService.new(user)
  end

  def self.total_steps_by_day(day)
    total_steps_hash = service.get_total_steps(day)
    total_steps = total_steps_hash["activities-steps"]["value"]
  end


  private
    def user
      @_user
    end

    def day
      @_day
    end


end
