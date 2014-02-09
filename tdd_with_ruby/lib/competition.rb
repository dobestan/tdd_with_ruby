class Competition
  attr_accessor :questions

  class Closed < StandardError
  end

  def start
    # we don't have to implement close method
    # that's why using mock
    close
  end
end
