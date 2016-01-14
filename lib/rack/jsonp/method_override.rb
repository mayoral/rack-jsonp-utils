module Rack
  module JSONP
    class MethodOverride
      HTTP_METHODS = %w(GET HEAD PUT POST DELETE OPTIONS PATCH)

      def initialize(app, method_override_param = '_method', callback_param = 'callback')
        @app = app
        @method_override_param = method_override_param
        @callback_param = callback_param
      end

      def call(env)
        request = Rack::Request.new(env)
        method_override = request.params[@method_override_param]

        if jsonp_callback_enabled?(request) && method_override && HTTP_METHODS.include?(method_override)
          env['jsonp.utils.method_override'] = method_override
          env['REQUEST_METHOD'] = method_override
        end

        @app.call(env)
      end

      private

      def jsonp_callback_enabled?(request)
        @callback_param && request.params[@callback_param]
      end
    end
  end
end
