module OmniauthMacros
  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
        provider: 'facebook',
        uid: '12345',
        info: {
          nickname: 'sampleuser1',
          email: 'sample@test.com'
        }
    )
  end
end