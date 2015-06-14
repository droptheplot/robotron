module Robotron
  class << self
    def call(env)
      body = if Rails.env.production?
        File.read(Rails.root.join('config', 'robots.txt'))
      else
        default_body
      end

      [200, default_headers, [body]]
    rescue Errno::ENOENT
      [404, default_headers, [default_body]]
    end

    def default_body
      "User-agent: *\nDisallow: /"
    end

    def default_headers
      {
        'Content-Type' => 'text/plain',
        'Cache-Control' => 'public, max-age=31557600'
      }
    end
  end
end
