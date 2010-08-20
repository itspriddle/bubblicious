module ActionController
  module Flash
    class FlashHash
      def error notice
        self[:error_message]  = true
        self[:notice]         = notice
      end
      alias_method :error=, :error

      def success notice
        self[:success] = true
        self[:notice]  = notice
      end
      alias_method :success=, :success
      alias_method :notice,   :success
      alias_method :notice=,  :success
    end
  end
end

# flash.success "This is a success message"