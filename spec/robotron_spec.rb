require 'spec_helper'

describe Robotron do
  ENV['RACK_ENV'] ||= 'production'

  let(:request) { Rack::MockRequest.new(Robotron) }

  describe 'without robots.txt' do
    it 'should response with default robots.txt body' do
      response = request.get('/robots.txt')

      expect(response.body).to eq("User-Agent: *\nDisallow: /")
    end
  end

  describe 'with robots.txt' do
    it 'should response with robots.txt.environment body' do
      allow(File).to receive(:read).and_return(ENV['RACK_ENV'])

      response = request.get('/robots.txt')

      expect(response.body).to eq(ENV['RACK_ENV'])
    end
  end
end
