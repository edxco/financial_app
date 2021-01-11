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

  def check_logged
    if logged_in?
      concat link_to "Logout", logout_path, method: :delete, class: "lg:p-4 py-3 px-0 font-bold block border-b-2 border-transparent hover:border-indigo-400 lg:mb-0 mb-2"
    else
      concat link_to "Login", login_path, class: "lg:p-4 py-3 px-0 font-bold block border-b-2 border-transparent hover:border-indigo-400 lg:mb-0 mb-2"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
    !!current_user
end

end
