module ApplicationHelper
  def button_form(user)
    if user.new_record?
      render inline: 'Sign Up'
    else
      render inline: 'Update account'
    end
  end

  def text_form(user)
    if user.new_record?
      render inline: 'Register to'
    else
      render inline: 'Update your profile on '
    end
  end

  def hello_user(user)
    if logged_in?
      concat content_tag :span, 'User: ', class: 'text-gray-700'
      concat content_tag :span, user.username.upcase, class: 'font-bold text-green-700'
    else
      render inline: ''
    end
  end

  def check_logged
    if logged_in?
      concat link_to 'Logout', logout_path, method: :delete, class: 'btn-logged'
    else
      concat link_to 'Login', login_path, class: 'btn-logged'
    end
  end

  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      'https://randomuser.me/api/portraits/women/49.jpg'
    end
  end

  def group_is_empty?(id)
    return 'd-none' unless Transaction.grouped_display(id).first.nil?
  end
end
