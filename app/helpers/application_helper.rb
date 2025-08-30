module ApplicationHelper
    def user_avatar(user)
      if user.avatar_url.present?
        user.avatar_url
      else
          asset_path 'avatar.png'
      end
    end
    def user_bio(user)
      if user.bio.present?
      user.bio
      else
      "#{user.name} hasn't written anything yet"
      end
    end
end
