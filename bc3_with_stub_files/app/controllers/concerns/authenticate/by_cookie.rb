module Authenticate::ByCookie
  private

  include DomainCookies

  def authenticate_with_cookies
    authenticate_with_identity_cookie || sign_in_with_remember_me_cookie
  end

  def authenticate_with_identity_cookie
    if user = find_verified_user('identity cookie', cookies.signed[:bc3_identity_id])
      authenticated user, by: :cookie
    end
  end

  def sign_in_with_remember_me_cookie
  end

  def find_verified_user(source, identity_id)
  end

  def request_cookie_authentication
  end

  def sign_in(user)
  end

  def sign_out
  end

  def set_identity_cookies(identity)
  end

  def identity_session_verification_cookie(identity)
  end
end
