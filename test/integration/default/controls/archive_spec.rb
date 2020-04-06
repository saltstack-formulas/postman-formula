# frozen_string_literal: true

control 'postman package' do
  title 'should be installed'

  describe file('/usr/local/postman-7.21.2-linux64/Postman') do
    it { should exist }
  end
end
