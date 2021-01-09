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

end
