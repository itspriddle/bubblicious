module ActionController
  module Flash
    class FlashHash
      # TODO: make #something 'arg' {block} call super
      def method_missing2(method_name, *args, &block)
        return self[method_name.to_sym] if key?(method_name.to_sym)
        match = method_name.to_s.match(/(.*?)([?=]?)$/)
        case match[2]
        when '='
          self[match[1].to_sym] = args.first
        when '?'
          !!self[match[1].to_sym]
        else
          if block_given? || !args.empty?
            super(method_name, *args, &blk)
          end
        end
      end

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