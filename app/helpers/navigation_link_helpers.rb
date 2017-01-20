helpers do
  def home_link
    <<-HTML
      <li class="pipe-separate t-light-green left"><a href="/">home</a></li>
    HTML
  end

  def register_link
    <<-HTML
      <li class="pipe-separate t-light-green left"><a href="/users/new">register</a></li>
    HTML
  end

  def login_link
    <<-HTML
      <li class="pipe-separate t-light-green left"><a href="/login">login</a></li>
    HTML
  end

  def logout_link
    <<-HTML
      <li class="pipe-separate t-light-green left"><a href="/logout">logout</a></li>
    HTML
  end

  def username_nav_display(user)
    <<-HTML
      <li class="pipe-separate t-light-green left">#{user.username}</li>
    HTML
  end
end
