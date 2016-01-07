module Robotron
  class << self
    def call(env)
      body = File.read(robots_path)

      [200, default_headers, [body]]
    rescue Errno::ENOENT
      [200, default_headers, [default_body]]
    end

    def environment
      ENV['RACK_ENV'] || 'development'
    end

    def robots_directory
      defined?(Rails) ? Rails.root.join('config') : File.join('spec')
    end

    def robots_path
      File.join(robots_directory, "robots.txt.#{ environment }")
    end

    def default_body
      "User-Agent: *\nDisallow: /"
    end

    def default_headers
      {
        'Content-Type' => 'text/plain',
        'Cache-Control' => 'public, max-age=31557600'
      }
    end
  end
end
