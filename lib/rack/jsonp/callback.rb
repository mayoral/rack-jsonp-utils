module Rack
  module JSONP
    class Callback
      def initialize(app, callback_param = 'callback')
        @app = app
        @callback_param = callback_param
      end

      def call(env)
        request = Rack::Request.new(env)

        callback = request.params[@callback_param]

        if callback
          env['jsonp.utils.callback'] = callback

          status, headers, response = @app.call(env)

          if headers['Content-Type'].to_s.start_with?('application/json')
            response = pad(callback, response)

            headers['Content-Length'] = response.first.bytesize.to_s
            headers['Content-Type']   = 'application/javascript'

            [200, headers, response]
          else
            [status, headers, response]
          end
        else
          @app.call(env)
        end
      end

      private

      def pad(callback, response)
        body = ''

        response.each do |s|
          body << s.to_s.gsub("\u2028", '\u2028').gsub("\u2029", '\u2029')
        end

        response.close if response.respond_to?(:close)

        ["/**/#{callback}(#{body})"]
      end
    end
  end
end
