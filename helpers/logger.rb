module Logger
  @display_logging = true

  class << self
    def log(text)
      puts(text) if @display_logging
    end
  end
end
