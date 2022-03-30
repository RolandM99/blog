module UsersHelper
  def user_img(user)
    user.photo.present? ? user.photo : 'https://p.kindpng.com/picc/s/544-5442212_download-free-icon-vectors-male-visio-user-icon.png'
  end
end
