module Logger
  @display_logging = true

  class << self
    def log(text)
      puts("[#{self.class}] #{text}") if @display_logging
    end
  end
end
