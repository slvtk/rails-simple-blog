module WelcomeHelper
  def gravatar_for(user)
  	puts user.email.downcase
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    puts gravatar_id
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end
end
